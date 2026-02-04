program test_mpi
    implicit none
    include 'mpif.h'

    integer :: i, N, sum, final_sum
    integer :: ierr, nproc, rank
    integer :: istart, iend, block, remainder
    real :: tstart, tend

    call MPI_INIT(ierr)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, nproc, ierr)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)

    if (rank == 0) then
        write(*,*) "Enter N: "
        read(*,*) N
    endif

    ! Broadcast N to everyone
    call MPI_BCAST(N, 1, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)

    ! Block decomposition
    block = N / nproc
    remainder = mod(N, nproc)

    if (rank < remainder) then
        istart = rank * (block + 1) + 1
        iend   = istart + block
    else
        istart = rank * block + remainder + 1
        iend   = istart + block - 1
    endif

    sum = 0

    call MPI_BARRIER(MPI_COMM_WORLD, ierr)
    call CPU_TIME(tstart)

    do i = istart, iend
        sum = sum + i
    enddo

    call MPI_REDUCE(sum, final_sum, 1, MPI_INTEGER, MPI_SUM, 0, MPI_COMM_WORLD, ierr)

    call CPU_TIME(tend)

    if (rank == 0) then
        write(*,"(a,i5,2x,a,i7)") "Sum of first ", N, " numbers is: ", final_sum
        write(*,*) "Time taken: ", tend - tstart
    endif

    call MPI_FINALIZE(ierr)
end program test_mpi