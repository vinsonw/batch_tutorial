@echo off

:: call get_power base power return_name

if %2 equ 0 (
    set /a %3=1
    goto :eof
)

set /a product=%1
set /a limit=%2-1

for /l %%g in (1,1,!limit!) do (
    set /a product=!product! * %1
)

set /a %3=%product%