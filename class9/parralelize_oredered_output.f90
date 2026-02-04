program parralelize_sum
    implicit none
    include 'mpif.h'

    integer :: rank, nproc, ierr, data_recv, j

    call mpi_init(ierr)
    call mpi_comm_size(mpi_comm_world, nproc, ierr)
    call mpi_comm_rank(mpi_comm_world, rank, ierr)

    if (rank /= 0) call mpi_send(rank, 1, mpi_int, 0, 0, mpi_comm_world, ierr)
    
    if (rank==0) then
        do j=0, nproc-1
        call mpi_recv(data_recv, 1, mpi_int, mpi_any_source, mpi_any_tag, mpi_comm_world, mpi_status_ignore, ierr)
            write(*,*) "Process no.: ", j, "message: ", data_recv
        enddo
    endif

    call mpi_finalize(ierr)
end program parralelize_sum


! OUTPUT:
! $ mpirun -np 8 parralelize_oredered_output.out
!  Process no.:            0 message:            4
!  Process no.:            1 message:            6
!  Process no.:            2 message:            7
!  Process no.:            3 message:            1
!  Process no.:            4 message:            3
!  Process no.:            5 message:            5
!  Process no.:            6 message:            2
! ^C[dell:14225] *** Process received signal ***
! [dell:14225] Signal: Segmentation fault (11)
! [dell:14225] Signal code: Address not mapped (1)
! [dell:14225] Failing at address: (nil)
! [dell:14225] [ 0] /lib/x86_64-linux-gnu/libc.so.6(+0x42520)[0x1261d1442520]
! [dell:14225] [ 1] /lib/x86_64-linux-gnu/libpmix.so.2(PMIx_server_finalize+0x928)[0x1261cecb25b8]
! [dell:14225] [ 2] /usr/lib/x86_64-linux-gnu/openmpi/lib/openmpi3/mca_pmix_ext3x.so(ext3x_server_finalize+0x386)[0x1261cf066ff6]
! [dell:14225] [ 3] /lib/x86_64-linux-gnu/libopen-rte.so.40(pmix_server_finalize+0xa0)[0x1261d194d5e0]
! [dell:14225] [ 4] /usr/lib/x86_64-linux-gnu/openmpi/lib/openmpi3/mca_ess_hnp.so(+0x66b4)[0x1261d13f76b4]
! [dell:14225] [ 5] /lib/x86_64-linux-gnu/libopen-rte.so.40(orte_finalize+0x65)[0x1261d1923385]
! [dell:14225] [ 6] mpirun(+0x1350)[0x5bbe30427350]
! [dell:14225] [ 7] /lib/x86_64-linux-gnu/libc.so.6(+0x29d90)[0x1261d1429d90]
! [dell:14225] [ 8] /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x80)[0x1261d1429e40]
! [dell:14225] [ 9] mpirun(+0x1415)[0x5bbe30427415]
! [dell:14225] *** End of error message ***
! Segmentation fault (core dumped)