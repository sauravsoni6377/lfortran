program arrays_70
    implicit none
    integer :: A(4) = [1,2,3,4]
    integer :: A1(3,3) = reshape([1,2,3,4,5,6,7,8,9], [3,3])
    integer :: A2(2,2,2) = reshape([1,2,3,4,5,6,7,8], [2,2,2])
    integer :: tmp(2,2) = reshape([5,5,5,5], [2,2])
    call temp(A, A1, A2, tmp)
contains
    subroutine temp(A, A1, A2, tmp)
        integer, intent(inout) :: A(:)
        integer, intent(inout) :: A1(:,:)
        integer, intent(inout) :: A2(:,:,:)
        integer, intent(inout) :: tmp(:,:)

        !!!! ArrayItem = ArrayItem
        A([1,2]) = A([2,1])
        if (A(1) /= 2 .or. A(2) /= 1) error stop

        A1([1,2],1) = A1([2,1],1)
        if (A1(1,1) /= 2 .or. A1(2,1) /= 1 .or. A1(3,1) /= 3 .or. &
            & A1(1,2) /= 4 .or. A1(2,2) /= 5 .or. A1(3,2) /= 6 .or. &
            & A1(1,3) /= 7 .or. A1(2,3) /= 8 .or. A1(3,3) /= 9) error stop

        A1([1,2],[2,3]) = A1([2,1],[2,3])
        if (A1(1,1) /= 2 .or. A1(2,1) /= 1 .or. A1(3,1) /= 3 .or. &
            & A1(1,2) /= 5 .or. A1(2,2) /= 4 .or. A1(3,2) /= 6 .or. &
            & A1(1,3) /= 8 .or. A1(2,3) /= 7 .or. A1(3,3) /= 9) error stop

        A1([1,2],1) = A1(1,[1,2])
        if (A1(1,1) /= 2 .or. A1(2,1) /= 5 .or. A1(3,1) /= 3 .or. &
            & A1(1,2) /= 5 .or. A1(2,2) /= 4 .or. A1(3,2) /= 6 .or. &
            & A1(1,3) /= 8 .or. A1(2,3) /= 7 .or. A1(3,3) /= 9) error stop

        A2(1,[1,2],[1,2]) = A2([1,2],[2,1],1)
        if (A2(1,1,1) /= 3 .or. A2(2,1,1) /= 2 .or. A2(1,2,1) /= 4 .or. A2(2,2,1) /= 4 .or. &
            & A2(1,1,2) /= 1 .or. A2(2,1,2) /= 6 .or. A2(1,2,2) /= 2 .or. A2(2,2,2) /= 8) error stop
        
        !!!! ArrayItem = ArrayConstant
        A([1,2]) = [5,5]
        if (A(1) /= 5 .or. A(2) /= 5) error stop

        A1([1,2],1) = [5,5]
        if (A1(1,1) /= 5 .or. A1(2,1) /= 5 .or. A1(3,1) /= 3 .or. &
            & A1(1,2) /= 5 .or. A1(2,2) /= 4 .or. A1(3,2) /= 6 .or. &
            & A1(1,3) /= 8 .or. A1(2,3) /= 7 .or. A1(3,3) /= 9) error stop

        A1([1,2],[1,2]) = tmp
        if (A1(1,1) /= 5 .or. A1(2,1) /= 5 .or. A1(3,1) /= 3 .or. &
            & A1(1,2) /= 5 .or. A1(2,2) /= 5 .or. A1(3,2) /= 6 .or. &
            & A1(1,3) /= 8 .or. A1(2,3) /= 7 .or. A1(3,3) /= 9) error stop

        A2([1,2],1,1) = [5,5]
        if (A2(1,1,1) /= 5 .or. A2(2,1,1) /= 5 .or. A2(1,2,1) /= 4 .or. A2(2,2,1) /= 4 .or. &
            & A2(1,1,2) /= 1 .or. A2(2,1,2) /= 6 .or. A2(1,2,2) /= 2 .or. A2(2,2,2) /= 8) error stop

        A2([1,2],1,[1,2]) = tmp
        if (A2(1,1,1) /= 5 .or. A2(2,1,1) /= 5 .or. A2(1,2,1) /= 4 .or. A2(2,2,1) /= 4 .or. &
            & A2(1,1,2) /= 5 .or. A2(2,1,2) /= 5 .or. A2(1,2,2) /= 2 .or. A2(2,2,2) /= 8) error stop

        !!! LHS and RHS contains common variable
        A = A([3,1,2,4])
        if (A(1) /= 3 .or. A(2) /= 5 .or. A(3) /= 5 .or. A(4) /= 4) error stop

        A1 = A1(:,[3,2,1])
        if (A1(1,1) /= 8 .or. A1(2,1) /= 7 .or. A1(3,1) /= 9 .or. &
            & A1(1,2) /= 5 .or. A1(2,2) /= 5 .or. A1(3,2) /= 6 .or. &
            & A1(1,3) /= 5 .or. A1(2,3) /= 5 .or. A1(3,3) /= 3) error stop

        A2 = A2(:,[2,1],:)
        if (A2(1,1,1) /= 4 .or. A2(2,1,1) /= 4 .or. A2(1,2,1) /= 5 .or. A2(2,2,1) /= 5 .or. &
            & A2(1,1,2) /= 2 .or. A2(2,1,2) /= 8 .or. A2(1,2,2) /= 5 .or. A2(2,2,2) /= 5) error stop

        A1(1,1:2) = A1(1,[2,1]) - A(1:2)
        if (A1(1,1) /= 2 .or. A1(2,1) /= 7 .or. A1(3,1) /= 9 .or. &
            & A1(1,2) /= 3 .or. A1(2,2) /= 5 .or. A1(3,2) /= 6 .or. &
            & A1(1,3) /= 5 .or. A1(2,3) /= 5 .or. A1(3,3) /= 3) error stop
    end subroutine
end program