program main
  use omp_lib
  implicit none
  integer, parameter :: nprint=15,nsample=10000
  integer :: pr_number, i, pr_sum, j
  real :: pr_av
  
  pr_sum = 0
  
  do i=1,nprint
   ! $omp parallel do
   do j=1,nsample 
     pr_number = int(rand()*10) 
     pr_sum = pr_sum+pr_number
   enddo
   ! $omp end parallel do

   pr_av = (1.d0*pr_sum) / real(i*nsample)
   write(*,*) i*nsample,pr_av 
 enddo

end program main
