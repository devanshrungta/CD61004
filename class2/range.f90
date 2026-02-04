program question_1
    implicit none

    integer :: thetha
    real :: v,g, thetha_radians, range
    v=10.0
    g=9.81
    WRITE(*,*) 'Enter velocity and g:'
    read(*,*) v,g
    WRITE(*,'(A, F8.2)') "Initial conditions v: ", v
    WRITE(*,'(A, F8.2)') "Initial conditions g: ", g
    do thetha=5,85,5
        thetha_radians = thetha *(3.14/180)
        range = ((2*v**2)/g)*cos(thetha_radians)*sin(thetha_radians)
        WRITE(*,*) "thetha: ", thetha
        WRITE(*,'(A, F8.2)') "thetha_radians: ", thetha_radians
        WRITE(*,'(A, F8.2)') "range: ", range
    end do
    WRITE(*,*) "Program Complete"

end program question_1