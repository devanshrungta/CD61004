program parallel_sum
  use omp_lib
  implicit none

  integer :: x
  x=1
  !$omp parallel private(x)
    x=x+1
  !$omp end parallel

  write(*,*) x

end program parallel_sum

