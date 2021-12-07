@echo off
:: get get_minnimum array_name return_name

set /a limit=%1_length-1

for /l %%a in (0, 1, %limit%) do (
    if %%a equ 0 (
        set  maximum=!%1[%%a]!
    ) else (
        if !%1[%%a]! gtr !maximum! (
            set  maximum=!%1[%%a]!
        )
    )
)


:: a bug was introduced by using Chinese "！"
set %2=!maximum!