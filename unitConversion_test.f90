! Filename: unitConversion_test.f90
! Description: Unit test for the temperature conversion module
! Author: Tim Troxler
! Date: 7/17/2015
! Compile instructions:
! gfortran -Wall -O3 -fimplicit-none -o unitConversion_test unitConversion_test.f90 unitConversion.f90 precision.f90
program unitConversion_test

    ! import modules
    use unitConversion
    use precision

    ! Declare variables
    implicit none
    
    call test_1()
    call test_2()
    call test_3()
    
contains

    ! Unit test #1
    ! Test the dual conversion of [-100, 100] in increments of 10 degrees f
    subroutine test_1()
    
        ! Declare variables
        logical                        :: testResult ! Test result
        real(kind=qp), dimension(1:21) :: testRange  ! Array of test inputs
        integer                        :: i          ! Loop counter
        
        write(*,*), "Test #1 - Convert F to C and back to F; range [-100, 100] in increments of 10 degrees f"
        
        ! Assume pass
        testResult = .true.
        
        testRange = (/ (i*10, i=-10, 10) /)
        do i=1, 21
            testResult = and(testResult, assert(testRange(i), testRange(i), fahrenheit(celsius(testRange(i)))))
        end do
        
        write(*,*)
        
    end subroutine test_1
    
    ! Unit test #2
    ! Test simple cases that can be done in your head
    subroutine test_2()
    
        ! Declare variables
        logical       :: testResult ! Test result
        real(kind=qp) :: testInput  ! Single test input
        
        write(*,*), "Test #2 - Convert -40F, -40C, 32F, 0C, 86F, and 30C"
        
        ! -40F, -40C
        testInput = -40
        testResult = assert(testInput, real(-40, qp), celsius(testInput))
        testResult = and(testResult, assert(testInput, real(-40, qp), fahrenheit(testInput)))
        
        ! 32F, 0C
        testInput = 32
        testResult = and(testResult, assert(testInput, real(0, qp), celsius(testInput)))
        testInput = 0
        testResult = and(testResult, assert(testInput, real(32, qp), fahrenheit(testInput)))
        
        ! 86F, 30C
        testInput = 86
        testResult = and(testResult, assert(testInput, real(30, qp), celsius(testInput)))
        testInput = 30
        testResult = and(testResult, assert(testInput, real(86, qp), fahrenheit(testInput)))
        
        write(*,*)
        
    end subroutine test_2
    
    ! Unit test #3
    ! Demonstrate a failure
    subroutine test_3()
    
        ! Declare variables
        logical       :: testResult ! Test result
        real(kind=qp) :: testInput  ! Single test input
        
        write(*,*), "Test #3 - Force a failure (123F /= 456C)"
        
        testInput = 123
        testResult = assert(testInput, real(456, qp), celsius(testInput))
        
        write(*,*)
        
    end subroutine test_3
    
    ! Assertion routine
    ! Log pass/fail status to the screen
    function assert(input, expected, actual)
    
        ! Declare variables
        logical         :: assert                  ! Assertion result
        real(kind = qp) :: input, expected, actual ! Inputs
        
        assert = expected == actual
        if (assert) then
            write(*,"(A,F10.5,A,F10.5)"), "PASS | Input: ", input, "; Actual: ", actual
        else
            write(*,"(A,F10.5,A,F10.5,A,F10.5)"), "FAIL | Input: ", input, "; Expected: ", expected, "; Actual: ", actual
        end if
        
    end function assert
    
end program unitConversion_test