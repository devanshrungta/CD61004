program he
    implicit none
    include 'mpif.h'

    integer :: id, np, ierr

    call MPI_Init(ierr)
    call MPI_Comm_Size(MPI_Comm_World, np, ierr)
    call MPI_Comm_rank(MPI_Comm_World, id, ierr)

    write(*,"(a,i1,a,i1)") "Hello world - rank/topic ' ",id,"/", np

    call MPI_Finalize(ierr)
end program