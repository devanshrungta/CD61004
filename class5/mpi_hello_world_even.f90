! incomplete code, given as assignmnet during end of the class
program main
    implicit none
    include 'mpif.h'
    integer :: ierr, rank

    call MPI_INIT(ierr)
    call MPI_Comm_rank(MPI_Comm_World, rank, ierr)

    IF (mod(rank,2)==0) write(*,*) 'Hello, world! '

    call MPI_FINALIZE(ierr)
end program main