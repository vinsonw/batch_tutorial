@echo off

set string=%2
set /a takeaway=4

:: get rid of the qutoation marks
for /f "usebackq tokens=*" %%a in ('%string%') do (

    :: if NO double quotations are passed in
    if %string%==%%~a (
        set /a takeaway=2
    )

    set string=%%~a
)

:: save the string content in a file.
:: Note "%2" couldn't be followed by a space,
:: otherwise the space would be written into file
echo %2>%TEMP%\temp_file.txt

:: associate length info to variable %1 by %1_length
:: %%~z notation to get the length(size) of the string
:: -4 to subtract the extra bytes: double quotes - 2 bytes,
:: \r\n(added automatically when saved to file) - 2 bytes
for %%g in ( %TEMP%\temp_file.txt ) do (
    set /a %1_length=%%~zg - %takeaway%
)

del %TEMP%\temp_file.txt

:: actually, you could attach anything to %1
set /a %1_anything=20

:: return %1 in the end, so it would have lenght info
set %1=%string%

