@echo off

:: usage:
:: sum array_name return_name

set /a sum=0
set /a limit=!%1_length!-1

for /l %%g in (0,1, %limit%) do (
    set /a sum=!sum! + !%1[%%g]!
)

set %2=!sum!
set sum=