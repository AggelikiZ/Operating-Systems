#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <poll.h>
#include <errno.h>
#include <signal.h>

#define max_workers 100 //define max number of workers 
int disp_worker[max_workers][2], worker_disp[max_workers][2], worker_list[max_workers], workers=10, bytes_read = 0, size =0, char_found = 0, workpool[max_workers], unfinished[max_workers], killed =0;
char *global_argv[3];
pid_t p[max_workers];
int alive_workers = 10;
int dead = 0, to_kill =0;

/* Worker list will have all workers. The value of each will worker has the following meaning:
-worker_list[i] = -1 ->worker is dead
-worker_list[i] = 1 -> worker is not done
-worker_list[i] = 0 -> worker is done
*/

/*workpool[] stores the offset that has been sent to a worker to read from*/

/*unfinished[] stores the offset of a worker that has been killed*/

/* to_kill is a flag to show if there is a signal to kill a worker*/

/* dead is a flag to show if there are dead workers whose work hasn't been passed to other workers*/

void explain_wait_status(pid_t pid, int status); 
void sighandler(int sig, siginfo_t *info, void *context);
void add_worker();
void get_status(int bytes_read, int size, int char_found);
void get_worker_status(int workers);
void kill_worker(pid_t p);

int main(int argc, char *argv[]) {
	
	int so_fd = open("/dev/tty", O_WRONLY);
	/*Copying argv*/
	for (int i = 0; i < argc; ++i) {
       		 global_argv[i] = argv[i];
    	}

        int fd,len,status, count, total_count=0, offset=0;
	char cc, buff[1];
	pid_t worker_pid;
        
	/* Opening file to read from */
        fd = open(argv[1], O_RDONLY);
    
        if(fd == -1) {
                perror("Problem opening file to read\n");
                exit(1);
        }
	/*using lseek to get size of input file*/
	size = lseek(fd, 0, SEEK_END);


	/*Create pipe bothways for dispather-workers*/
	for (int i=0; i<workers; i++){
		pipe(disp_worker[i]);
		pipe(worker_disp[i]);
	}
	
	/*Creating multiple worker processes*/
	for(int  i=0; i<workers; i++){
		p[i] = fork(); //Creating Child Process (Worker)
        	if(p[i] < 0) {
                	perror("fork");
                	exit(1);
        	}
        	/* Actions for child process */
    		else if(p[i] == 0) {
			worker_pid = getpid();
			worker_list[i]=0; //setting workers to be available by default
        		dup2(disp_worker[i][0],0); //using to dupe to copy pipe
			dup2(worker_disp[i][1],1);
			/*Closing end of pipes to prevent probles*/
			close(worker_disp[i][0]);
			close(worker_disp[i][1]);
			close(disp_worker[i][1]);
			close(disp_worker[i][0]);
			/*using execv for each child(worker)*/
			if(execv("a1.4-worker", argv) == -1) {
       				perror("Problem calling worker");
        			exit(1);
    			}
        	}
        	/* Actions for father process */
       	 	else {
			/*Making pipe with workers non-blocking*/
			if(fcntl(worker_disp[i][0], F_SETFL, O_NONBLOCK)==-1){
                        	perror("Problem not-blocking dispatcher");
                        	exit(1);
                	}

		}
	}
	/*Calling sigaction to handle signal*/
        struct sigaction sa;
        sa.sa_flags = SA_SIGINFO;
       	sa.sa_sigaction = sighandler;
        sigemptyset(&sa.sa_mask);

        if(sigaction(SIGUSR1, &sa, NULL) < 0) {
        	perror("sigaction");
                exit(1);
        }

	sleep(2);
	int idx = 0;
	char buff_out[10];
	/* While loop until all characters are read*/
	while((size - idx) > 0){
		/*Checking if there is a signal to kill a worker*/
		if(to_kill ==1 ){
			/*Send SIGINT to kill worker*/
			if(kill(p[workers-1], SIGINT)==-1) perror("Problem killing worker");
       			unfinished[killed] = workpool[workers-1]; //storing the offset of dead worker*/
			killed++;
        		worker_list[workers-1] = -1; //Show that the worker has been killed
        		workers -=1;
       			dead = 1;
			to_kill = 0; //return flag to zero
		}
		/*Loop to iterate over workers*/
		for(int i=0; i<workers; i++){
			sleep(1);
			/* Checking if worker is available*/
			if(worker_list[i] == 0){
				/*If there is a dead worker pass to current worker its unfinished work*/
				if(dead == 1){
					if(write(disp_worker[i][1], &unfinished[killed-1], sizeof(unfinished[killed-1]))==-1){ // Sending offset to worker
                                        perror("Promlem writing to pipe for worker"); 
					}
					workpool[i] = unfinished[killed-1];
					idx-=10;
					worker_list[i]=1; //worker has a job to do
					killed -=1;	//reduce number of workers who have died and their work needs to be passed to other workers
					if(killed == 0) dead = 0; //There are no unhandled works
				}
				/*Else, pass the next offset to be read to worker*/
				else{
					workpool[i] = offset; //storing the offset of worker
					if(write(disp_worker[i][1], &offset, sizeof(offset))==0){ // Sending offset to worker
                                		perror("Promlem writing to pipe for worker"); 
    
    		                    	}
    
                        		worker_list[i] = 1; //Worker has a job to do
                        		offset+=10;
				}
			}
 
			/*If there is nothing to read from pipe, continue to next worker*/
			if((read(worker_disp[i][0], &count, sizeof(count))== -1)){ // Getting count from worker
        			if(errno == EAGAIN || errno == EWOULDBLOCK) continue;
				 perror("Promlem reading from worker pipe");	
    			}
			else{
				worker_list[i] = 0; //Worker has finished job
				idx+=10;	// continue to next part of file
				bytes_read = idx;
				total_count+=count;//adding subcount to total count
				char_found = total_count;
			}

	
		}
	}
	/*After all the file is read write to pipe dispatcher-worker pipe the total count*/
	int buff_work[2];
	buff_work[0] = 1; //pass the necessary flag for the frontend to read*/
	buff_work[1] = total_count;
	if(write(1, &buff_work, sizeof(buff_work))==-1) perror("Problem writing to sto");


	return 0;
}
 
    

/* Function to explain wait */
void explain_wait_status(pid_t pid, int status) {
        if(WIFEXITED(status))
                fprintf(stderr, "Worker  with PID = %ld terminated normally, exit status = %d\n", (long)pid, WEXITSTATUS(status));
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


/* Fubction to handles signal*/
void add_worker() {
	/*Same logic with the creation of the other workers*/
	pipe(disp_worker[workers]);
      	pipe(worker_disp[workers]);
	p[workers] = fork();
	if(p[workers] < 0) {
        	perror("fork");
                exit(1);
        }
        else if(p[workers] == 0) {
		worker_list[workers] = 0;
       		dup2(disp_worker[workers][0],0);
                dup2(worker_disp[workers][1],1);
                close(worker_disp[workers][0]);
               	close(worker_disp[workers][1]);
                close(disp_worker[workers][1]);
                close(disp_worker[workers][0]);
               	if(execv("a1.4-worker", global_argv) == -1) {
              	 	perror("Problem adding worker");
                        exit(1);
                }
	}
	else{
		if(fcntl(worker_disp[workers][0], F_SETFL, O_NONBLOCK)==-1){
                                perror("Problem not-blocking dispatcher");
                                exit(1);
                        }   
		workers++;
	}
}
/*Function to send status of work to frontend*/
void get_status(int bytes_read, int size, int char_found){
	int buff[4];
	buff[0] = 3;//pass the necessary flag
	buff[1] = bytes_read; //bytes read so far
	if(bytes_read>size) bytes_read = size;
	buff[2] = size;
	buff[3] = char_found; //characters found so far
	/*Write info to distaptcher-frontend pipe*/
	if(write(1, &buff, sizeof(buff))==-1) perror("Problem writing to disp-worker pipe");

	}
/*Function to send total number of alive workers to frontend*/
void get_worker_status(int workers){	
	int buff[2];
	buff[0] = 4;//pass necessary flag
	buff[1] = workers;
	/*Write info to distaptcher-frontend pipe*/
	if(write(1, &buff, sizeof(buff))==-1) perror("Problem writing to disp-worker pipe");
}

/*Sighandler to handle signals*/

void sighandler(int sig, siginfo_t *info, void *context) {
    // Extract case number from signal
    int case_number = info->si_value.sival_int;

    // Handle different cases based on signal number
    switch (case_number) {
	/*Add worker*/
        case 1:
            add_worker(); //call function
            break;
        /*Remove worker*/
	case 2:
	    to_kill =1; //make flag = 1
            break;
        /*Get status */
	case 3:
            get_status(bytes_read, size, char_found); //call function
            break;
	/*Get number of alive workers*/
        case 4:
	    get_worker_status(workers); //call function
            break;
        default:
            printf("Received SIGUSR1 with unknown case number: %d\n", case_number);
            break;
    }
}
