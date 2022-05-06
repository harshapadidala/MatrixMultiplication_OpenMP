CC=clang
LIBS=src/matrix.c
TUNE= -O2

all: sequential	mpi

sequential:
		$(CC) $(TUNE) -o seq $(LIBS) src/sequential.c

mpi:
		 /usr/local/openmpi/bin/mpicc $(TUNE) -o mpi $(LIBS) src/mpi.c