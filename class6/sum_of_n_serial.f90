program test_mpi
    implicit none
    integer :: i, N, sum

    N=100

    sum=0
    do i = 1,N
        sum=sum+i 
    enddo

    write(*,"(a,i5,2x,a,i7)") "Sum of first ",N," numbers is: ", sum
end program test_mpi