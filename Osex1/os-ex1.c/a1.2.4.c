#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void father(pid_t p, int status);
void child(pid_t child_p, pid_t father_p, char* arg[]);
void explain_wait_status(pid_t pid, int status);

int main (int argc, char* argv[]) {
	pid_t p, mypid, father_p;
	int status;

	p = fork(); //Creating Child Processa
	if(p < 0) {
		perror("fork");
		exit(1);
	}
	/* Actions for child process */
	else if(p == 0) {
		mypid = getpid();
		father_p = getppid();
		child(mypid, father_p, argv);
	}
	/* Actions for father process */
	else {
		mypid = getpid();
		father(p, status);
	}
	return 0;
}

/*Function for father process*/
void father(pid_t p,int status) {
	p = wait(&status);
	explain_wait_status(p, status);
}
/*Function for child process, using execv */
void child(pid_t child_p, pid_t father_p, char* arg[]) {	
	if(execv("char-count/a1.1-C", arg) == -1) {
		perror("Problem executing a1.1-C file");
		exit(1); 
	}

}     	    	
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

	
