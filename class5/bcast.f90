program test_broadcast
    implicit none
    include 'mpif.h'
    integer :: nproc, rank, ierr, num

    call MPI_INIT(ierr)
    call MPI_Comm_Size(MPI_Comm_World, nproc, ierr)
    call MPI_Comm_rank(MPI_Comm_World, rank, ierr)

    if (rank==0) num=1

    call MPI_BCAST(num, 1, MPI_INT, 0, MPI_Comm_World, ierr)
    num=num+rank

    write(*,"(a,i4,a,i4)") "Result in process id: ", rank, " is ", num

    call MPI_Finalize(ierr)
end program