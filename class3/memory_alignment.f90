program memory_alignment
    implicit none

    integer::n
    integer :: i,j,k
    integer,allocatable :: A(:,:,:)
    real :: tstart, tend

    write(*,*) "Enter n:"
    read(*,*) n
    allocate(A(n,n,n))

    call cpu_time(tstart)
    do i=1,n
        do j=1,n
            do k=1,n
                A(i,j,k)=i*j*k
            enddo
        enddo
    enddo 
    call cpu_time(tend)

    write(*,*) "Time i,j,k: ", tend-tstart

    call cpu_time(tstart)
    do k=1,n
        do j=1,n
            do i=1,n
                A(i,j,k)=i*j*k
            enddo
        enddo
    enddo 
    call cpu_time(tend)
    write(*,*) "Time k,j,i: ", tend-tstart


end program memory_alignment