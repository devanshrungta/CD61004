program serial_monte_carlo_pi
    implicit none

    integer :: n,i
    real :: x,y, pi_estimate

    write(*,*) "Enter n:"
    read(*,*) n

    call random_seed()
    call random_number(x)
    call random_number(y)

    pi_estimate = 0.0

    do i=1,n
        call random_number(x)
        call random_number(y)
        if (x**2 + y**2 <= 1.0) then
            pi_estimate = pi_estimate + 1.0
        end if
    end do

    write(*,*) "Estimated Pi: ", 4*pi_estimate/real(n)


end program serial_monte_carlo_pi