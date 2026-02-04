program serial_monte_carlo_pi
   implicit none
   include 'mpif.h'

   integer, parameter :: num_samples = 1000000
   integer :: i
   real :: x, y, pi_estimate, total

   integer :: ierr, nproc, rank
   integer :: start, end, stride, remainder

   call mpi_init(ierr)
   call mpi_comm_size(mpi_comm_world, nproc, ierr)
   call mpi_comm_rank(mpi_comm_world, rank, ierr)

   ! Initialize the random number generator
   call random_seed()
   call random_number(x)
   call random_number(y)

   stride = num_samples/nproc
   remainder = mod(num_samples, nproc)

   if (rank<remainder) then
      start = rank * (stride + 1) + 1
      end = start + stride
   else
      start = rank * stride + remainder + 1
      end = start + stride - 1
   endif

   ! Initialize the pi estimate
   pi_estimate = 0.0d0

   do i = start, end
      call random_number(x)
      call random_number(y)
      if (x**2 + y**2 <= 1.0d0) then
         pi_estimate = pi_estimate + 1.0d0
      end if
   end do

   call mpi_reduce(pi_estimate, total, 1, mpi_real, mpi_sum, 0, mpi_comm_world, ierr)
   ! Calculate the final estimate of Pi and write it to the console
   if (rank==0) then
      write(*, *) "Estimated Pi: ", 4*total/real(num_samples)
   endif

   call mpi_finalize(ierr)

end program serial_monte_carlo_pi

