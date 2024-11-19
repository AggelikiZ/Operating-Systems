#
# Makefile
# 

CC = gcc

# CAUTION: Always use '-pthread' when compiling POSIX threads-based
# applications, instead of linking with "-lpthread" directly.
CFLAGS = -Wall -O2 -pthread
LIBS = 

all: pthread-test simplesync-mutex simplesync-atomic kgarten mandel mandel2 mandel3

## Pthread test
pthread-test: pthread-test.o
	$(CC) $(CFLAGS) -o pthread-test pthread-test.o $(LIBS)

pthread-test.o: pthread-test.c
	$(CC) $(CFLAGS) -c -o pthread-test.o pthread-test.c

## Simple sync (two versions)
simplesync-mutex: simplesync-mutex.o
	$(CC) $(CFLAGS) -o simplesync-mutex simplesync-mutex.o $(LIBS)

simplesync-atomic: simplesync-atomic.o
	$(CC) $(CFLAGS) -o simplesync-atomic simplesync-atomic.o $(LIBS)

simplesync-mutex.o: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_MUTEX -c -o simplesync-mutex.o simplesync.c

simplesync-mutex.s: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_MUTEX -S -g -o simplesync-mutex.s simplesync.c

simplesync-atomic.o: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_ATOMIC -c -o simplesync-atomic.o simplesync.c

simplesync-atomic.s: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_ATOMIC -S -g -o simplesync-atomic.s simplesync.c




## Kindergarten
kgarten: kgarten.o
	$(CC) $(CFLAGS) -o kgarten kgarten.o $(LIBS)

kgarten.o: kgarten.c
	$(CC) $(CFLAGS) -c -o kgarten.o kgarten.c


## Mandel
mandel: mandel-lib.o mandel.o
	$(CC) $(CFLAGS) -o mandel mandel-lib.o mandel.o $(LIBS)

mandel2: mandel-lib.o mandel2.o
	$(CC) $(CFLAGS) -o mandel2 mandel-lib.o mandel2.o $(LIBS)

mandel3: mandel-lib.o mandel3.o
	$(CC) $(CFLAGS) -o mandel3 mandel-lib.o mandel3.o $(LIBS)

#mandel-semaphore: mandel-semaphore.o
#	$(CC) $(CFLAGS) -o mandel-semaphore mandel-semaphore.o $(LIBS)

#mandel-cond_var: mandel-cond_var.o
#	$(CC) $(CSFLAGS) -o mandel_cond_var mandel_cond_var.o $(LIBS)

#mandel-semaphore: mandel-semaphore.o
#	$(CC) $(CFLAGS) -DSYNC_SEMAPHORE -c -o mandel-semaphore.o mandel.c

#mandel-cond_var: mandel-cond_var.o
#	$(CC) $(CFLAGS) -DSYNC_COND_VAR -c -o mandel-cond_var.o mandel.c

mandel-lib.o: mandel-lib.h mandel-lib.c
	$(CC) $(CFLAGS) -c -o mandel-lib.o mandel-lib.c $(LIBS)

mandel.o: mandel.c
	$(CC) $(CFLAGS) -c -o mandel.o mandel.c $(LIBS)

mandel2.o: mandel2.c
	$(CC) $(CFLAGS) -c -o mandel2.o mandel2.c $(LIBS)

mandel3.o: mandel3.c
	$(CC) $(CFLAGS) -c -o mandel3.o mandel3.c $(LIBS)
clean:
	rm -f *.s *.o pthread-test simplesync-{atomic,mutex} kgarten mandel mandel2 mandel3 
