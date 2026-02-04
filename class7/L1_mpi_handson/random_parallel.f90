program te
    implicit none
    include 'mpif.h'

    integer,parameter :: N=300
    real :: r(300,300),total, ftotal
    integer :: i 
    integer :: ierr, nproc, rank
    integer :: start, end, stride, remainder


    call mpi_init(ierr)
    call mpi_comm_size(mpi_comm_world, nproc, ierr)
    call mpi_comm_rank(mpi_comm_world, rank, ierr)

    open(unit=1,file='random_numbers.dat',action='read') 
    stride = N/nproc
    remainder = mod(N, nproc)
    
    if (rank<remainder) then
        start = rank * (stride + 1) + 1
        end = start + stride
    else
        start = rank * stride + remainder + 1
        end = start + stride - 1
    endif
   
    do i=start, end
        read(1,*) r(i,:)
    enddo 
    total=0
    do i=start, end
        total=total+sum(r(i,:))
    enddo    

    call mpi_reduce(total, ftotal, 1, mpi_real, mpi_sum, 0, mpi_comm_world, ierr)
    if (rank==0) then
        write(*,*) "Final results:"
        write(*,*) ftotal/real(N*N) 
    endif
    call mpi_finalize(ierr)
end program te
