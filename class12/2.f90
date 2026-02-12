program test
    use omp_lib
    implicit none
    integer :: i, A(1000), local_A(1000)

    do i=1,1000; A(i)=i; enddo

    !$omp parallel private(local_A)
    !$omp do
    do i=1,999
        local_A(i)=local_A(i+1)
    enddo
    !$omp end do

    !$omp critical

    !$omp end critical
    !$omp end parallel

    do i=1,999
        if (A(i)/=i+1) write(*,*) i,A(i)
    enddo

end program test