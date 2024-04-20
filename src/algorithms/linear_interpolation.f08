program linear_interpolation
    implicit none
    real(8),dimension(8)::height,age
    real(8)::x,y
    logical::correct

    height = [0.15, 0.3, 1.5, 3.0, 6.1, 7.6, 9.1, 10.7]
    age = [9.0, 13.0, 27.0, 41.0, 83.0, 107.0, 131.0, 157.0]
    x = 5.0
    call linear_interpolation(height,age,x,y,correct)
    if (correct) then
        write(*,*) 'age = ',y
    else
        write(*,*) 'error'
    end if


contains

    function linear_interpolation_two_point(x1,y1,x2,y2,x) result (y)
        implicit none
        real(8), intent(in)::x1,y1,x2,y2,x
        real(8)::y
        y = (x-x1)*(y1-y2)/(x1-x2)+y1
    end function linear_interpolation_two_point

    subroutine linear_interpolation(x_values,y_values,x,y,correct)
        implicit none
        real(8),dimension(:),intent(in)::x_values,y_values
        real(8),intent(inout)::x,y
        logical::correct
        real(8)::x1,y1,x2,y2
        integer(8)::i
        correct = .FALSE.
        do i=1,size(x_values) - 1
            if (x_values(i)<=x .AND. x<=x_values(i+1)) then
                x1 = x_values(i)
                y1 = y_values(i)
                x2 = x_values(i+1)
                y2 = y_values(i+1)
                y = linear_interpolation_two_point(x1,y1,x2,y2,x)
                correct=.TRUE.
                return
            end if
        end do
    end subroutine
end program linear_interpolation


