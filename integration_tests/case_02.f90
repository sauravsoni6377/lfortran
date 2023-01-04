program case_02
    implicit none

    ! local variable declaration
    integer :: marks, out
    marks = 81

    select case (marks)

       case (91:100)
          out = 0
          print*, "Excellent!"

       case (81:90)
          out = 1
          print*, "Very good!"

       case (71:80)
          out = 2
          print*, "Well done!"

       case (61:70)
          out = 3
          print*, "Not bad!"

       case (41:60)
          out = 4
          print*, "You passed!"

       case (:40)
          out = 5
          print*, "Better try again!"

       case default
          out = 6
          print*, "Invalid marks"

    end select
    print*, "Your marks are ", marks

    if (out /= 1) error stop

    ! case default at the top
    select case (marks)

       case default
          print*, "Invalid marks"

       case (91:100)
          print*, "Excellent!"

       case (81:90)
          print*, "Very good!"

       case (71:80)
          print*, "Well done!"

       case (61:70)
          print*, "Not bad!"

       case (41:60)
          print*, "You passed!"

       case (:40)
          print*, "Better try again!"

    end select
    print*, "Your marks are ", marks

    ! case default in the middle
    select case (marks)

       case (91:100)
          print*, "Excellent!"

       case (81:90)
          print*, "Very good!"

       case default
          print*, "Invalid marks"

       case (71:80)
          print*, "Well done!"

       case (61:70)
          print*, "Not bad!"

       case (41:60)
          print*, "You passed!"

       case (:40)
          print*, "Better try again!"

    end select
    print*, "Your marks are ", marks

end program
