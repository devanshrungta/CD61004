! Question: 
program question_1
    implicit none
    integer :: iter,i,j
    real :: coord1, coord2, coord3
    character :: char1
    open(unit=1,file="mol.xyz",action="read")
    open(unit=2,file="output.xyz",action="write")
    read(1,*) i
    read(1,*) j
    write(2,*) i
    write(2,*) j
    do iter=1,i
        read(1,*) char1, coord1, coord2, coord3
        write(2,"(a2,3f10.3)") char1, coord1, coord2, coord3+3
    end do
end program question_1