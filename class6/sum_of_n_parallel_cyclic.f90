program test_mpi
    implicit none
    include 'mpif.h'
    
    integer :: i, N, sum, final_sum
    integer :: ierr, nproc, rank
    real :: tstart, tend

    call CPU_TIME(tstart)
    call MPI_INIT(ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, nproc, ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr) 

    if (rank==0) then
        write(*,*) "Enter N: "
        read(*,*) N
    endif
    
    sum=0

    do i = 1+rank,N,nproc
        sum=sum+i 
    enddo

    call MPI_REDUCE(sum, final_sum, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD, ierr)

    call CPU_TIME(tend)
    if (rank==0) then
        write(*,"(a,i5,2x,a,i7)") "Sum of first ",N," numbers is: ", final_sum
        write(*,*) "Time taken: ", tend-tstart
    endif

    call MPI_FINALIZE(ierr)
end program test_mpi