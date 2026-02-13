program cache_coherence
  use omp_lib
  implicit none

  integer, parameter :: n = 1000
  integer :: i, index
  integer :: x(10), y(10)
  integer :: sum_x, sum_y

  x = 0; y = 0

  !$omp parallel do reduction(+:sum_x, sum_y) 
  do i = 1, n
    index = mod(i, 10) + 1

    x(index) = x(index) + 1
    y(index) = y(index) + 1
  end do
  !$omp end parallel do

  ! compute sums
  sum_x = sum(x)
  sum_y = sum(y)

  write(*,*) 'sum_x:', sum_x
  write(*,*) 'sum_y:', sum_y

end program 

