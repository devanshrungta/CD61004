program fix
    use omp_lib
    implicit none
    integer, parameter :: n = 1000
    integer :: i, index
    integer :: x(10), y(10)
    integer :: local_x(10), local_y(10)
    integer :: sum_x, sum_y
    x = 0; y = 0
    !$omp parallel private(local_x, local_y)
    local_x=0
    local_y=0
    !$omp do private(index)
    do i = 1, n
        index = mod(i, 10) + 1
        local_x(index) = local_x(index) + 1
        local_y(index) = local_y(index) + 1
    end do
    !$omp end do

    !$omp critical
    x = local_x + x
    y = local_y + y
    !$omp end critical
    sum_x = sum(x)
    sum_y = sum(y)
    !$omp end parallel 
    write(*,*) 'sum_x:', sum_x
    write(*,*) 'sum_y:', sum_y
end program
