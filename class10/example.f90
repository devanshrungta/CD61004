! First program on openMP. Just printing "#thread/ total #threads'
program hello
    use omp_lib
    implicit none
    
    integer :: id

    !$omp parallel
    write(*,*) "Hello from process: ", omp_get_thread_num(),"/", omp_get_num_threads()
    !$omp end parallel

end program hello