/*
 * mandel.c
 *
 * A program to draw the Mandelbrot Set on a 256-color xterm.
 *
 */

#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <semaphore.h>
#include <sys/wait.h>
#include <sys/mman.h>

/*TODO header file for m(un)map*/

#include "mandel-lib.h"

#define MANDEL_MAX_ITERATION 100000

/***************************
 * Compile-time parameters *
 ***************************/

/*
 * Output at the terminal is is x_chars wide by y_chars long
*/
int y_chars = 50;
int x_chars = 90;

/*
 * The part of the complex plane to be drawn:
 * upper left corner is (xmin, ymax), lower right corner is (xmax, ymin)
*/
double xmin = -1.8, xmax = 1.0;
double ymin = -1.0, ymax = 1.0;
	
/*
 * Every character in the final output is
 * xstep x ystep units wide on the complex plane.
 */
double xstep;
double ystep;


sem_t *sem;
int NPROCS;


int safe_atoi(char *s, int *val)
{
        long l;
        char *endp;

        l = strtol(s, &endp, 10);
        if (s != endp && *endp == '\0') {
                *val = l;
                return 0;
        } else
                return -1; 
}




/*
 * This function computes a line of output
 * as an array of x_char color values.
 */
void compute_mandel_line(int line, int color_val[])
{
	/*
	 * x and y traverse the complex plane.
	 */
	double x, y;

	int n;
	int val;

	/* Find out the y value corresponding to this line */
	y = ymax - ystep * line;

	/* and iterate for all points on this line */
	for (x = xmin, n = 0; n < x_chars; x+= xstep, n++) {

		/* Compute the point's color value */
		val = mandel_iterations_at_point(x, y, MANDEL_MAX_ITERATION);
		if (val > 255)
			val = 255;

		/* And store it in the color_val[] array */
		val = xterm_color(val);
		color_val[n] = val;
	}
}

/*
 * This function outputs an array of x_char color values
 * to a 256-color xterm.
 */
void output_mandel_line(int fd, int color_val[])
{
	int i;
	
	char point ='@';
	char newline='\n';

	for (i = 0; i < x_chars; i++) {
		/* Set the current color, then output the point */
		set_xterm_color(fd, color_val[i]);
		if (write(fd, &point, 1) != 1) {
			perror("compute_and_output_mandel_line: write point");
			exit(1);
		}
	}

	/* Now that the line is done, output a newline character */
	if (write(fd, &newline, 1) != 1) {
		perror("compute_and_output_mandel_line: write newline");
		exit(1);
	}
}

void compute_and_output_mandel_line(int fd, int line, int procnum)
{
	/*
	 * A temporary array, used to hold color values for the line being drawn
	 */	
	int color_val[x_chars];
	int ret;

	compute_mandel_line(line, color_val);
	/*Wait for semaphore that corresponds to specific thread*/	
	ret = sem_wait(&sem[(int)procnum]);
	if(ret<0) {
		perror("sem_wait");
		exit(1);
	}

	output_mandel_line(fd, color_val);
	/*Post on semaphore of next thread (circular)*/
	ret = sem_post(&sem[((int)procnum + 1)%NPROCS]);
	if(ret<0) {
		perror("sem_post");
		exit(1);
	}
	
}

/*
 * Create a shared memory area, usable by all descendants of the calling
 * process.
 */
void *create_shared_memory_area(unsigned int numbytes)
{
	int pages;
	void *addr;

	if (numbytes == 0) {
		fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
		exit(1);
	}

	/*
	 * Determine the number of pages needed, round up the requested number of
	 * pages
	 */
	pages = (numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;

	/* Create a shared, anonymous mapping for this number of pages */
	/* TODO:  
		addr = mmap(...)
	*/
	//ADDED HERE
	addr= mmap(NULL, pages * sysconf(_SC_PAGE_SIZE), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0); 
    
        if(addr == MAP_FAILED) {
                perror("mmap");
                exit(1);
        }

	//END ADD
	return addr;
}

void destroy_shared_memory_area(void *addr, unsigned int numbytes) {
	int pages;

	if (numbytes == 0) {
		fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
		exit(1);
	}

	/*
	 * Determine the number of pages needed, round up the requested number of
	 * pages
	 */
	pages = (numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;

	if (munmap(addr, pages * sysconf(_SC_PAGE_SIZE)) == -1) {
		perror("destroy_shared_memory_area: munmap failed");
		exit(1);
	}
}

int main(int argc, char* argv[])
{
	int line, status, ret;
	 // get number of threads
        
	if (safe_atoi(argv[1], &NPROCS) < 0 || NPROCS <= 0) {
                 fprintf(stderr, "`%s' is not valid for `thread_count'\n", argv[1]);
                 exit(1);
         }

	//printf("%d", NPROCS);
	
	pid_t p[NPROCS];

	xstep = (xmax - xmin) / x_chars;
	ystep = (ymax - ymin) / y_chars;

	/*
	 * draw the Mandelbrot Set, one line at a time.
	 * Output is sent to file descriptor '1', i.e., standard output.
	 */


	/* Create semaphores on shared memory*/
        sem = create_shared_memory_area(sizeof(sem_t)*NPROCS);
	
	/*Initialize first semaphore to 1*/
	ret = sem_init(&sem[0], 1, 1); 
        if(ret!=0) {
                perror("sem_init");
                exit(1);
        }
        /*Initialize all other semaphores to 0*/
	for(int i=1; i<NPROCS; i++) {
                ret = sem_init(&sem[i], 1, 0); 
                if(ret<0) {
                        perror("sem_init");
                        exit(1);    
                }
        }
	/*Use fork inside a loop to create NPROCS child processes*/
	for(int i=0; i<NPROCS; i++) {
		p[i] = fork();
		if(p[i]<0){
			perror("fork");
			exit(1);
		}	
		if(p[i] == 0) {
			/*Each process calculates and outputs the corresponding lines*/
			for(int line = i; line<=y_chars; line+=NPROCS) {
				compute_and_output_mandel_line(1, line, i);
			}
			exit(0);
		}
		
	}
	
	/*Wait for all processes to terminate*/
	for(int i=0; i<NPROCS; i++) {
		p[i] = wait(&status);
	//	explain_wait_status(p[i], status);
	}
	
	/*Destroy semaphores*/
	for(int i=0; i<NPROCS; i++) {
		ret = sem_destroy(&sem[i]);
		if(ret!=0) {
			perror("sem_destroy");	
		}
	}
	/*Destroy shared memory area*/
	destroy_shared_memory_area(sem, sizeof(sem));

	reset_xterm_color(1);
	return 0;
}



void explain_wait_status(pid_t pid, int status) {
        if(WIFEXITED(status))
                fprintf(stderr, "Child with PID = %ld terminated normally, exit status = %d\n", (long)pid, WEXITSTATUS(status));
        else if(WIFSIGNALED(status))
                fprintf(stderr, "Child with PID = %ld was terminated by a signal, signo = %d\n", (long)pid, WTERMSIG(status));
        else if(WIFSTOPPED(status))
                fprintf(stderr, "Child with PID = %ld has been stopped by a signal, signo = %d\n", (long)pid, WSTOPSIG(status));
        else {
                fprintf(stderr, "%s: Internal error: Unhandled case, PID = %ld, status = %d\n", __func__, (long)pid, status);
                exit(1);
        }
        fflush(stderr); 
}

