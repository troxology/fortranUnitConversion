! Filename: unitConversion.f90
! Description: Module of unit conversion utility functions
! Author: Tim Troxler
! Date: 7/17/2015
module unitConversion

    ! Import modules
    use precision
    implicit none

contains

    ! Convert fahrenheit to celsius
    ! c = (f - 32) * 5 / 9
    function celsius(fahrenheit) 
        real(kind = qp) :: fahrenheit, celsius
        celsius = (fahrenheit - 32) * 5 / 9
    end function celsius
    
    ! Convert celsius to fahrenheit
    ! f = (c * 9 / 5) + 32
    function fahrenheit(celsius)
        real(kind = qp) :: fahrenheit, celsius
        fahrenheit = (celsius * 9 / 5) + 32
    end function fahrenheit
    
end module unitConversion