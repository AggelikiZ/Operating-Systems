#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char *argv[]) {

	int fd1, fd2, oflags, mode, count = 0;
	char cc='a', buff1[2], buff2[1024];
	ssize_t  rcnt, wcnt;
	size_t len, idx = 0;

	/* Checking if user gave the right amount of arguments */
	if(argc != 4) {
		printf("You need to use 3 arguments:\n1. The name of the file you want to read\n2. The name of the file you want to write\n3. The character you want to find\n");
		exit(1);
	}
		
	/* Opening file to read from */
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
	
	cc = argv[3][0];

	/* Counting the appearence of the desired character */
	
	for(;;) {
		rcnt = read(fd1, buff1, sizeof(buff1)-1);
		if(rcnt == 0)
			break;
		if(rcnt == -1) {
			perror("Problem reading file\n");
			return 1;
		}
		if(buff1[rcnt-1] == cc)
			count++;  	
	}

	close(fd1); //closing the first file after completing reading from it

	
	/*Writing the result to the file */
	
	snprintf(buff2, 1024 ,"The character '%c' appears %d times in file %s.\n", cc, count, argv[1]);
	len = strlen(buff2);

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
	
	close(fd2);
	
	return 0;

}
