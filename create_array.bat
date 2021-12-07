:: inherit "setlocal EnableDelayedExpansion" outside this script
@echo off

goto :main

:set_index

    call create_string %~1[%~2] "!%~3!"

goto :eof

:: cretae_array name "delimiter" "content"
:main

   call create_string delimiter %2 
   call create_string content %3 

   set /a offset=0
   set /a index=0

   for /l %%g in ( 0, 1, %content_length% ) do (
        set character=!content:~%%g,1!

        if !character!==!delimiter! (
            set /a length=%%g - !offset!
            call :set_index %1 !index! "content:~!offset!, !length!"

            set /a offset=%%g+1
            set /a index=!index!+1
        )
   )

   :: adding the last element to the array
   call :set_index %1 !index! content:~%offset%, %content_length%

   :: make the size(length) of the array right
   set /a %1_length=%index% + 1 

   :: the name of the array should give everything
   set %1=%content%

   :: clean up
   set content=
   set length=
   set offset=
   set character=
   set delimiter=
   set index=

goto :eof