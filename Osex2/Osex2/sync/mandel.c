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
#include "mandel-lib.h"
#include <semaphore.h>
#include <pthread.h>
#include <errno.h>

#define MANDEL_MAX_ITERATION 100000

#define perror_pthread(ret, msg) \
	do {errno = ret; perror(msg); } while(0)

/*
#if defined(SYNC_SEMAPHORE) ^ defined(SYNC_COND_VAR) == 0
# error You must #define exactly one of SYNC_SEMAPHORE or SYNC_COND_VAR.
#endif

#if defined(SYNC_SEMAPHORE)
# define USE_SEMAPHORE 1
#else
# define USE_SEMAPHORE 0 
#endif
*/

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

/*
 * This function computes a line of output
 * as an array of x_char color values.
 */

void *safe_malloc(size_t size)
{
        void *p;

        if ((p = malloc(size)) == NULL) {
                fprintf(stderr, "Out of memory, failed to allocate %zd bytes\n",
                        size);
                exit(1);
        }

        return p;
}

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



int thrdcnt; //used for number of threads
sem_t *sem; //used for semaphores


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

void *compute_and_output_mandel_line(void *thread_num)
{
	/*
	 * A temporary array, used to hold color values for the line being drawn
	 */
	int color_val[x_chars], ret;
	
	/*A loop that iterates over all lines (lines = y_chars)*/

	for(int line=(int)thread_num; line<=y_chars; line+=thrdcnt) {
		compute_mandel_line(line, color_val);
		/* CRITICAL PART START*/
		ret = sem_wait(&sem[(int)thread_num]); //wait on the semaphore for the thread with number thread_num
		if(ret<0) {
			perror("sem_wait");
			exit(1);
		}

		output_mandel_line(1, color_val);
		/* CRITICAL PART END */

		ret = sem_post(&sem[((int)thread_num + 1)%thrdcnt]); // post semaphore for the the next thread, (use %thrdnct to be circular) 
		if(ret<0) {
			perror("sem_post");
			exit(1);
		}
	}
	return NULL;
}

int main(int arg, char *argv[])
{
	int ret;
	
	 // get number of threads
	if (safe_atoi(argv[1], &thrdcnt) < 0 || thrdcnt <= 0) {
                 fprintf(stderr, "`%s' is not valid for `thread_count'\n", argv[1]);
                 exit(1);
         }


	xstep = (xmax - xmin) / x_chars;
	ystep = (ymax - ymin) / y_chars;

	/*
	 * draw the Mandelbrot Set, one line at a time.
	 * Output is sent to file descriptor '1', i.e., standard output.
	 */
	
	pthread_t thr[thrdcnt]; //Create an array for threads
	
	/*Use safe malloc to create an array of size thrdcnt for sempahores*/
	sem = (sem_t*)safe_malloc(thrdcnt * sizeof(sem_t));
	
	ret = sem_init(&sem[0], 0, 1); //Initialize the first semaphore to 1
	
	if(ret!=0) {
		perror("sem_init");
		exit(1);
	}
	/*Initialize all other semaphores to 0*/
	for(int i=1; i<thrdcnt; i++) {
		ret = sem_init(&sem[i], 0, 0);
		if(ret<0) {
			perror("sem_init");
			exit(1);	
		}
	}
	
	/*Create threads and assign them to compute and output the needed lines*/
	for(int i=0; i<thrdcnt; i++){
		ret = pthread_create(&thr[i], NULL, compute_and_output_mandel_line, (void*)i);
		if(ret){
			perror_pthread(ret, "pthread create");
		}
	}
	
	/*Wait for threads to terminate*/
	for (int i = 0; i < thrdcnt; i++) {
                ret = pthread_join(thr[i], NULL);
                if (ret) {
                        perror_pthread(ret, "pthread_join");
                        exit(1);
                }
        }

	/*Destrory semaphores*/

	for (int i=0; i<thrdcnt; i++){
		ret = sem_destroy(&sem[i]);
		if(ret!=0){
			perror("sem_destroy");

		}
	}
	
	
	reset_xterm_color(1);
	return 0;
}
