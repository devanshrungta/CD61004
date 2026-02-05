program test
    use omp_lib
    implicit none

    integer, parameter :: N=100
    integer :: i, sum

    sum = 0

    !$omp parallel do reduction(+:sum)
    do i = 1, N
        sum = sum + i
    end do
    !$omp end parallel do

    write(*,*) "Sum of first ", N, " numbers is: ", sum

end program test