#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

void father(pid_t p ,int status);
void child(int fd1, int fd2, char* arg[]); 
void explain_wait_status(pid_t pid, int status);

int main (int argc, char* argv[]) {
	pid_t p, mypid, father_p;
	int fd1, fd2, oflags, mode, count = 0;

	int status;
	
	/* Opening input file to read from */
	fd1 = open(argv[1], O_RDONLY);
    
        if(fd1 == -1) {
                perror("Problem opening file to read\n");
                exit(1);
        }
    
        oflags = O_CREAT | O_WRONLY | O_TRUNC;
        mode = S_IRUSR | S_IWUSR;

        /* Opening file to write to */
        fd2 = open(argv[2], oflags, mode);

        if(fd2== -1) {
                perror("Problem opening file to write\n");
                exit(1);
        }


	p = fork(); //Creating child process after opening the files
	
	/* Error Handling during fork */
	if(p < 0) {
		perror("fork");
		exit(1);
	}
	/* Actions for child process */
	else if(p == 0) {
		mypid = getpid();
		father_p = getppid();
		child(fd1, fd2,  argv);
	}
	/* Actions for father process */
	else {
		mypid = getpid();
		father(p, status);
		/* Closing input and output file */
		close(fd1);
		close(fd2);
	}
	return 0;
}

/*Function for father process to wait for the execution of the child process */
void father(pid_t p,int status) {
	p = wait(&status);
	explain_wait_status(p, status);
}

/* Function for chlid process to count the desired character */
void child(int fd1, int fd2, char* arg[]) {
	int count = 0;
      	ssize_t  rcnt, wcnt;
        size_t len, idx = 0;
	char cc='a', buff1[2], buff2[1024];
	
	cc = arg[3][0];
	/* Counting the appearence of the desired character */

	for(;;) {
                rcnt = read(fd1, buff1, sizeof(buff1)-1);
                if(rcnt == 0)
                        break;
                if(rcnt == -1) {
                        perror("Problem reading file\n");
                        exit(0);
                }
                if(buff1[rcnt-1] == cc)
                        count++;
        }
	
	snprintf(buff2, 1024 ,"The character '%c' appears %d times in file %s.\n", cc, count, arg[1]);
        len = strlen(buff2);

        /*Writing the result to the file */

	for(;;) {
                if(idx >= len)
                        break;
                wcnt = write(fd2, buff2 + idx, len - idx);

                if(wcnt == -1) {
                        perror("Problem writing file:\n");
                        exit(0);
                }
                idx += wcnt;
        }
}
     	    	
/* Function to explain wait */ 
void explain_wait_status(pid_t pid, int status) {
	if(WIFEXITED(status))
		fprintf(stderr, "Child with PID = %ld terminated normally, exit status = %d\n", (long)pid, WEXITSTATUS(status));
	else if(WIFSIGNALED(status))
		fprintf(stderr, "Child with PID = %ld was terminated by a signal, signo = $d\n", (long)pid, WTERMSIG(status));
	else if(WIFSTOPPED(status))
		fprintf(stderr, "Child with PID = %ld has been stopped by a signal, signo = %d\n", (long)pid, WSTOPSIG(status));
	else {
		fprintf(stderr, "%s: Internal error: Unhandled case, PID = %ld, status = %d\n", __func__, (long)pid, status);
		exit(1);
	}
	fflush(stderr); 
}

	
