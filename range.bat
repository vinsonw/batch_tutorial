@echo off

:: usage:
:: range array_name "delimiter" start stop step (python style)
:: range array_name "delimiter" stop
:: range array_name "delimiter" start stop

:: strip "" around delimiter
call create_string delimiter %2

set  start=%3
set  stop=%4
set  step=%5

if "%stop%" equ "" (
    set /a stop=%start%
    set /a start=0
)

if "%step%" equ "" (
    set /a step=1
)

:: concatenate all numbers separated by comma
set content=
for /l %%g in (%start%, %step%, %stop%) do (

    :: contatenate syntax
    set content=!content!%%g

    if not %%g equ %stop% (
        set content=!content!%delimiter%
    )
)

call create_array %1 "%delimiter%" "!content!"
