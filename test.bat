@echo off

setlocal EnableDelayedExpansion
goto :main

:main
setlocal

    call create_array list_of_numbers "," "3,-6,5,10,-5,3"
    call get_minimum list_of_numbers min
    echo !list_of_numbers!
    echo !min!

endlocal
goto :eof