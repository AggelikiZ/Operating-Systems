#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char *argv[]) {

        int count = 0, fd, offset;
        char cc='a', buff1[2];
        ssize_t  rcnt;
        size_t len, idx = 0;
    
        cc = argv[2][0];
	
	/* Opening file to read from */
        fd = open(argv[1], O_RDONLY);
    
        if(fd == -1) {
                perror("Problem opening file to read in worker\n");
                exit(1);
        }
	
	/* While loop to make workers run repeatedly*/

	while(1){
 	/*Checking if there is somehing to read from dispatcher-worker pipe*/
	if((rcnt=read(0,&offset, sizeof(offset)))==-1){
		perror("Problem reading from dispatcher pipe");
	}
	else if(rcnt == 0){ // if pipe empty continue
		continue;
	}
	
		
	lseek(fd, offset, SEEK_SET); //move file descriptor to the offset that worker has received from dispatcher*/
	/*Search 10 bytes after offset*/  		 
        for(int i=0; i<10; i++) {
                rcnt = read(fd, buff1, sizeof(buff1)-1);
                if(rcnt == 0)
                        break;
                if(rcnt == -1) {
                        perror("Problem reading file\n");
                        return 1;
                }
		if(buff1[rcnt-1] == cc)
                        count++;
        }
	//sleep(1);
	/*Write count of characters to worker-dispatcher pipe*/
	if(write(1,&count, sizeof(count))==-1){
                  perror("Problem wriring from dispatcher pipe");
	}
	count = 0; //initialize count  

	}
	return 0;

}
                                                                                                                                                   
