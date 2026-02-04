program main
    implicit none
    include 'mpif.h'
    integer :: ierr

    call MPI_INIT(ierr)

    write(*,*) 'Hello, world! '

    call MPI_FINALIZE(ierr)
end program main