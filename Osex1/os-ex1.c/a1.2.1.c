#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void father(pid_t p ,int status);
void child(pid_t child_p, pid_t father_p);
void explain_wait_status(pid_t pid, int status);

int main (void) {
	pid_t p, mypid, father_p;
	int status;

	p = fork(); //Create child process
	
	/* Error Handling */
	if(p < 0) {
		perror("fork");
		exit(1);
	}
	/* Actions for child process */
	else if(p == 0) {
		mypid = getpid();
		father_p = getppid();
		child(mypid, father_p);
	}
	/*Actions for father process */
	else {
		mypid = getpid();
		father(p,status);
	}
	return 0;
}

/*Functions for child and father processes*/

void father(pid_t p,int status) {
	p = wait(&status);
	explain_wait_status(p, status);
}

void child(pid_t child_p, pid_t father_p) {
	printf("Hello World! My fathert's pid is %d and my pid is %d\n", father_p, child_p);
}

/*Function to exlpain wait */

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

	