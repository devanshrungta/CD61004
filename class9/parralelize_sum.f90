program parralelize_sum
    implicit none
    include 'mpih.f'

    integer :: rank, nproc, ierr

    mpi_init(ierr)
    mpi_comm_size()


end program parralelize_sum