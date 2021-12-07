@echo off

:: call get_abs number return_name

if %1 lss 0 (
    set /a %2=-%1
) else (
    set /a %2=%1
)
