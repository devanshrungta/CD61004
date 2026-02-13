program test
 use omp_lib 
 implicit none 
  integer :: i,j,k
  integer,parameter ::n=100
  real :: a(n,n), b(n,n), c(n,n),temp
  real(kind=8):: tstart,tend 

  c = 0.0; a=1.0; b=2.0 

  tstart=omp_get_wtime()
  do j = 1, n
    do k = 1, n
      !$omp parallel do
      do i = 1, n
        c(i,j) = c(i,j) + a(i, k) * b(k, j) 
      end do
      !$omp end parallel do
    end do
  end do
  tend=omp_get_wtime()

  write(*,*) 'elapsed time: ',tend-tstart 
  write(*,*) 'sum: ',sum(c)

end 
