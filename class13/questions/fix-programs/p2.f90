program test
  use omp_lib
  implicit none
  integer :: i, a
  integer, parameter :: n = 100
  integer :: arr(n)

  ! Initialize array
  arr = 1
  a = 0

  ! Parallel region
  !$omp parallel do reduction(+:a)
  do i = 1, n
    a = a + arr(i)
  end do
  !$omp end parallel do

  write(*,*) "Sum:", a
end program test

