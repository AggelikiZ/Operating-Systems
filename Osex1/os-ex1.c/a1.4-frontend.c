#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <errno.h>

void dispatcher_sighandler(int signum);
void explain_wait_status(pid_t pid, int status);
struct SignalData {
    int case_number;
};

int main (int argc, char* argv[]) {
	ssize_t rcnt;
	char  c, buff[10], add[] = "add", rm[] = "remove", stat[] = "stat", worker[] = "wrk";
	pid_t p;
	int  status, pfd[2], count, workers_to_add, info[4];
	struct SignalData data;
	
    
        if(argc != 3) {
                 printf("You need to use 2 arguments:\n1. The name of the file you want to read\n2. The character you want to find\n");
                 exit(1);
         }
	
	pipe(pfd); //Creating pipe with dispatcher
	
	p = fork(); //using fork to generate child -> dispatcher
	
	if(p<0){
		perror("fork");
		exit(1);
	}
	
	/*Using execv with argv as second argument to pass to child process (dispatcher)*/
	else if(p == 0){
		dup2(pfd[1], 1); 
            	close(pfd[0]);
            	close(pfd[1]);
		if(execv("a1.4-dispatcher", argv) == -1) {
               		perror("Problem executing a1.4-dispatcher.c file");
       			exit(1);
          	}
	}
	
	/* Actions for father process (frontend) */
	else{
			
		/*Making pipe with dispatcher and standart input non-blocking*/	
		if(fcntl(pfd[0], F_SETFL, O_NONBLOCK)==-1){
			perror("Problem not-blocking dispatcher");
			exit(1);
		}
		
		if(fcntl(0, F_SETFL, O_NONBLOCK)==-1){
                          perror("Problem not-blocking standard input");
                          exit(1);
                 
		}
	
		printf("If you want to add a worker, write add\nIf you want to remove workers, write remove\nIf you want to get status write stat\nIf you want to get the number of alive workers write wrk\n");
		while(1){
			
			if((read(pfd[0], &info, sizeof(info))==-1)){
   

				if(errno == EAGAIN || errno == EWOULDBLOCK){ //Checking if there is nothing to read from pipe
					
					if(read(0,buff, sizeof(buff))==-1){
						if(errno == EAGAIN || errno == EWOULDBLOCK) continue;	
						else perror("Problem reading from standard input");
					}
					
					int count1 = 0, count2 = 0, count3 = 0, count4 = 0;
					for(int i=0; i<3; i++){
						if(buff[i] == add[i]) count1++;
						else break;
					}
					for(int i =0; i<6; i++){
						if(buff[i] == rm[i]) count2++;
                                                 else break;
					}
					for(int i =0; i<4; i++){
                                                if(buff[i] == stat[i]) count3++;
                                                 else break;
                                        }
					for(int i =0; i<3; i++){
                                                if(buff[i] == worker[i]) count4++;
                                                 else break;
                                        }


					/* Using sigqueue wit the following signals:
					-> Value = 1 : Add worker
					-> Value = 2 : Remove worker
					-> Value = 3 : Get number of alive workers
					-> Value = 4 : Get status of work
					*/ 
					if(count1 == 3){
						printf("adding\n");
						data.case_number = 1;
    						union sigval value1;
						value1.sival_int = data.case_number;
    						if (sigqueue(p, SIGUSR1, value1) == -1) {
        						perror("sigqueue");
        						exit(EXIT_FAILURE);
    						}
						printf("sent signal\n");
						
					}
					if(count2 == 6){
						printf("removing worker\n"); 
                                             	data.case_number = 2;
    						union sigval value2;
    						value2.sival_int = data.case_number;
    						if (sigqueue(p, SIGUSR1, value2) == -1) {
        						perror("sigqueue");
       							 exit(EXIT_FAILURE);
    						}
						printf("sent signal\n");
                                                
                                        }
					 if(count3 == 4){ 
                                                printf("getting status\n");
                                                data.case_number = 3;
                                                union sigval value3;
						value3.sival_int = data.case_number;
                                                if (sigqueue(p, SIGUSR1, value3) == -1) {
                                                        perror("sigqueue");
                                                        exit(EXIT_FAILURE);
                                                }
                                                printf("sent signal\n");
    
                                        }
					 if(count4 == 3){ 
                                                printf("finding workers\n");
                                                data.case_number = 4;
                                                union sigval value4;
						value4.sival_int = data.case_number;
                                                if (sigqueue(p, SIGUSR1, value4) == -1) {
                                                        perror("sigqueue");
                                                        exit(EXIT_FAILURE);
                                                }
                                                printf("sent signal\n");
    
                                	}			
					
			
				}
				else perror("Problem reading from dispatcher pipe");
			}
			else{
				/* The first argument of info, info[0] indicates what should be done with the message from worker from pipe with dispatcher*/
				if(info[0]==1){
					printf("Total count of characters is = %d\n", info[1]);
					break;
					}
				else if(info[0]==3){
					printf("%d/%d work done, %d characters found so far\n", info[1], info[2], info[3]);
				
				}
				else if(info[0]==4){
					printf("%d workers are alive\n", info[1]);
					}
			
			}
		}

	}
}
