program test
  use omp_lib
  implicit none
  integer :: i, sum
  integer, parameter :: n = 100
  integer :: arr(n)

  ! Initialize array
  arr = 1

  ! Initialize sum
  sum = 0

  ! Parallel region
  !$omp parallel do reduction(+:sum)
  do i = 1, n
    sum = sum + arr(i)
  end do
  !$omp end parallel do

  write(*,*) "Sum:", sum
end program test 

