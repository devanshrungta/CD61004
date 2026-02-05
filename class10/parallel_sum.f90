program test
    use omp_lib
    implicit none

    integer, parameter :: N=100
    integer :: i, partial_sum, sum

    !$omp parallel private(partial_sum)

    !$omp do
    do i=1,N
        partial_sum = partial_sum + i
    end do
    !$omp end do

    !$omp critical
    sum = partial_sum + sum
    !$omp end critical

    !$omp end parallel

    write(*,*) "Sum of first ", N, " numbers is: ", sum

end program test