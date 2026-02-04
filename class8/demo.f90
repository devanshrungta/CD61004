program demo
    implicit none
    include 'mpif.h'

    integer :: p, id, ierr, root, msg, tag
    call mpi_init(ierr)
    call mpi_comm_size(mpi_comm_world, p, ierr)
    call mpi_comm_rank(mpi_comm_world, id, ierr)

    root=0; tag=0

    if(id==root) then
        msg=10
        call mpi_send(msg, 1, mpi_int, 1, tag, mpi_comm_world, ierr)
    else
        call mpi_recv(msg,1,mpi_int, id-1, mpi_any_taG,mpi_comm_world,mpi_status_ignore,ierr)
        write(*,*) id, 'recieved from process:',id-1
        call mpi_send(msg,1,mpi_int,mod(id+1,p),tag,mpi_comm_world,ierr)
    endif

    if(id==root) then
        call mpi_recv(msg,1,mpi_int,p-1,mpi_any_tag,mpi_comm_world, mpi_status_ignore,ierr)
        write(*,*) id,'received from process:',p-1
    endif

    call mpi_finalize(ierr)
end program demo