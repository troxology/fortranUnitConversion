! Filename: precision.f90
! Description: Module of precision parameters. Based on 
!              http://fortranwiki.org/fortran/show/Real+precision
! Author: Tim Troxler
! Date: 7/17/2015
module precision

    integer, parameter :: sp = selected_real_kind(6, 37)
    integer, parameter :: dp = selected_real_kind(15, 307)
    integer, parameter :: qp = selected_real_kind(33, 4931)
    
end module precision