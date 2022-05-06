##### Parallel Matrix Multiplication Using OpenMP and MPI 

----------

#### The multiplication of two matrices is to be implemented as 

* a sequential program 
* an OpenMP shared memory program 
* a message passing program using the MPI standard 

## Matrix multiplication

The aim is to multiply two matrices together.To multiply two matrices, the number of columns of the first matrix has to match the number of lines of the second matrix. The calculation of the matrix solution has independent steps, it is possible to parallelize the calculation.

## Project Tree

    .
    |-- data
    |   |-- mat_4_5.txt
    |   `-- mat_5_4.txt
    |-- src
    |   |-- matrix.c
    |   |-- matrix.h
    |   |-- mpi.c
    |   |-- omp.c
    |   |-- sequential.c
    |-- Makefile
    |-- random_float_matrix.py
    |-- README.md
    `-- Test-Script.sh


The python script `random_float_matrix.py` generates `n x m` float matrices.
`./Test-Script.sh` is a script that generates test matrices with the python script, compiles the C-programs with `make` and executes the diffrent binaries with the test-matrices. The output of the script are the execution times of the particular implementations.


## Performance Test    

All performance tests were run on atlas Built GCP cluster
 
    * * * * * * * 100x100 Matrix
    with sequential    0m0.032s
    with omp           0m0.034s
    with mpi(4p)       0m1.242s

    * * * * * * * 1000x1000 Matrix
    with sequential    0m11.791s
    with omp           0m4.182s
    with mpi(4p)       0m12.682s
    
    * * * * * * * 5000x5000 Matrix
    with sequential    26m52.342s
    with omp           4m57.186s
    with mpi(4p)       5m2.174s

    * * * * * * * 5000x5000 Matrix
    with sequential    26m52.342s
    with omp           4m57.186s
    with mpi(4p)       5m2.174s
    
The output times are the `real times` from the unix `time` command. 
You can see the advantages of parallel computation in the last matrix calculation. The parallel calculation is about 5 times faster (for large matrices).
