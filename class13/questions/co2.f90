!program to calculate the intra-molecular distance of CO2 molecule; each frame has several CO2 molecules and each CO2 molecule has
! two C-O bonds 

program test
 use omp_lib
 implicit none
 integer,parameter :: nframe=20,nmol=1000
 integer :: nlines, i, k, j, natoms, frame
 real :: X(nmol,3,3),vec(3,3)
 character(len=1) :: c1
 real :: dist(2), sum_dist(2)
 
 open(unit=1, file ='co2.xyz', action='read')


 sum_dist=0.0 
 !starting infinite loop and exit when there is no data to read 
 do frame=1,nframe 
   read(1,*) natoms 
   read(1,*)
   do k=1, nmol
     do j=1,3 
       read(1,*) c1, X(k,j,:)
     enddo
   enddo
   !$omp parallel do reduction(+:sum_dist) private(vec, dist)
   do k=1, nmol
     vec=X(k,:,:)
     call distance(vec,dist)
     sum_dist=sum_dist+dist 
   end do
   !$omp end parallel do
 enddo
   

 sum_dist=sum_dist/(real(nframe)*real(nmol))
 write(*,*) "The average distance between C and O atoms are",sum_dist(1),"and",sum_dist(2)

end program
 
subroutine distance(x, d)
 implicit none

 real :: x(3,3),d(2),dr(3)

!first C-O
 dr=x(1,:)-x(2,:)
 d(1)=sqrt(dot_product(dr,dr))
!second C-O 
 dr=x(1,:)-x(3,:) 
 d(2)=sqrt(dot_product(dr,dr))
 
end subroutine distance


