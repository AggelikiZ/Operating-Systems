#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>


void explain_wait_status(pid_t pid, int status);
void sighandler(int signum);


int main (int argc, char* argv[]) {
	pid_t p;
	int status, fd1, fd2, oflags, mode, len, idx=0, count = 0, total_count=0, P = 5;
	char cc, buff1[2], buff2[1024];
	ssize_t rcnt, wcnt;
	int fd[2];

	struct sigaction sa;
	sigset_t sigset;
	/*Necessary definitions for sigaction*/	
	sa.sa_handler = sighandler;
	sa.sa_flags = SA_RESTART;
	sa.sa_mask = sigset;

	/*Using sigaction to handle SIGINT signal*/
	if(sigaction(SIGINT, &sa, NULL) < 0) {
        	perror("sigaction");
              	exit(1);
         }

	/*Creating pipe and checking for possible errors*/
	if(pipe(fd) < 0) {
		perror("Problem creating pipe\n");
		exit(1);
	}
	
	//Check if the user privides the needed arguments
	
	if(argc != 4) {
                 printf("You need to use 3 arguments:\n1. The name of the file you want to read\n2. The name of the file you want to write\n3. The character you want to find\n");
                 exit(1);
         }
	
	// Opening the file we want to read from
	
	fd1 = open(argv[1], O_RDONLY);

        if(fd1 == -1) {
	        perror("Problem opening file to read\n");
                exit(1);
        }

        oflags = O_CREAT | O_WRONLY | O_TRUNC;
        mode = S_IRUSR | S_IWUSR;

        //Opening the file we want to write to
	
	fd2 = open(argv[2], oflags, mode);

        if(fd2== -1) {
                perror("Problem opening file to write\n");
                exit(1);
        }


        cc = argv[3][0];

	
	for(int i=0; i<P; i++) {
		p = fork();  // Starting child processes
		if(p < 0) {
			perror("fork");
			exit(1);
		}
		else if(p==0){
			for(;;){
				pid_t child = getpid();
				count = 0;
				// The children processes read from input file count the appeareance of the charcter
		        	
				rcnt = read(fd1, buff1, sizeof(buff1)-1);
          			if(rcnt == 0){
					close(fd[1]);
					sleep(4);//using sleep to be able to press C^
                 			exit(0);
				} 
         			if(rcnt == -1) {
                   			perror("Child, problem reading from pipe");
					exit(1);
          			}
	
          			if(buff1[rcnt-1] == cc)
                   			count++;
          		
				//Writing the result of counting the charecter to pipe  			
				if(write(fd[1], &count, sizeof(count)) != sizeof(count)) {
                  			perror("write to pipe");
                   			exit(1);
         			}
			sleep(0.1);			
			}
		}

	}

	
	//Father waiting for child processes to end		   
	int n = P;
	while(n>0){
		pid_t pi = wait(&status);
		explain_wait_status(pi, status);
		n--;
	}
	close(fd[1]);//closing writing end of pipe
	close(fd1);//closing input file
	
	//Reading the result from pipe
	
	while((read(fd[0], &count, sizeof(count))!=0)){ 
     		total_count += count;
                         		
 	      	}
              
	//printf("Here  %d\n", total_count);
	snprintf(buff2, 1024 ,"The character '%c' appears %d times in file %s.\n", cc, total_count, argv[1]);
	len = strlen(buff2);
  	
	//Writing to resut to output file
        
	for(;;) {
        	if(idx >= len)
                	break;
               	wcnt = write(fd2, buff2 + idx, len - idx);
  
               	if(wcnt == -1) {
                	perror("Problem writing file:\n");
                        return 1;
                }	
		idx += wcnt;
        }		  
        close(fd2); //closing output file
	sleep(2);
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

/*Function to handle signal*/
void sighandler(int signum) {
	char command[100];
	snprintf(command, sizeof(command), "ps -o pid= --ppid %d | grep -v $$| sed 's/^/Child : /'", getpid());
	system(command);

}

	
