:: batch tutorial
:: https://www.youtube.com/watch?v=JbAyxKjUPs0&list=PL69BE3BF7D0BB69C4

@echo off

rem E16 Prompt

rem echo Please enter your name:
rem set /p name=

rem echo.
rem echo Your name is %name%

rem E17 Labels

rem :another

rem cls
rem ver

rem :label
rem vol

rem E18 goto
rem echo This is the beginning

rem  :start

rem echo this is the start

rem goto :end

rem :middle

rem echo this is the middle

rem :end

rem echo this is the end
rem goto :middle


rem E19 Comments

rem this is a comment, which does nothing.
:: this is a comment/lable


rem E20 //Basic Functions

rem goto :main

rem :function
rem     echo this is another function
rem goto :eof

rem :main
rem     echo    Main function here!
rem     call :function
rem     echo end of program
rem goto :eof

rem E21 //Fuction Arguments

rem goto :main


rem :say_sth
rem     echo I am saying %~1 and %~2!
rem goto :eof

rem :main
rem     echo This is the main function!
rem     call :say_sth tiger boat
rem     echo end
rem goto :eof

rem E22 //Function "Return"(not real return)

rem goto :main

rem :new_func
rem     echo      Changing a variable...
rem     set %~1=Launch
rem goto :eof

rem :main
rem     echo starting main function
rem     set new_var=Dinner
rem     echo new var is %new_var%
rem     call :new_func new_var 
rem     echo now new var is %new_var%

rem goto :eof

rem E23 //Function Local Scope(setlocal/endlocal)

rem goto :main

rem :func
rem setlocal
rem     echo Func says P is %p%
rem     set x=30
rem     echo Func says X is %x%
rem endlocal
rem goto :eof

rem :main
rem setlocal
rem     echo The main function is being called!
rem     set p=4
rem     echo Main syas P is %p%

rem     call :func

rem     echo Main says X is %x%
rem endlocal
rem goto :eof

rem E24 //Script Local Scope

rem goto :main

rem :main
rem     echo Creating a variable...
rem     set global_var=existing

rem     setlocal
rem         set local_var=existing
rem     endlocal

rem goto :eof


rem E25 // "Return" in Local Functions
rem Using "endlocal" to "return"

rem goto :main

rem :add_one
rem setlocal
rem     echo Performing add one on X...
rem endlocal & set /a x=%x%+1
rem goto :eof

rem :main
rem setlocal
rem     echo Main function is runing
rem     echo Setting X to 1...
rem     set /a x=1
rem     call :add_one
rem     echo X == %x%
rem endlocal
rem goto :eof


rem E26 Returning Passed in Variables
rem pass "y %y%" at the same time to modify the value of variable "y"
rem OR you could just use "%~1=%~1+1"

rem goto :main

rem :add_one
rem setlocal
rem     echo Running add_one...

rem endlocal & set /a %~1=%~1+%~2
rem goto :eof

rem :main
rem setlocal

rem     set /a x=10
rem     set /a y=50
    
rem     echo Created variable y to set it to %y%
rem     echo.
rem     call :add_one y x 
rem     echo.
rem     echo The variable y is now %y%

rem endlocal
rem goto :eof

rem E27 //If Statement

rem goto :main


rem :main
rem setlocal
rem     echo Hello World!
rem     echo.
rem     set /a food=10
rem     set /a needed_food=20

rem     if %food%==%needed_food% (
rem         echo We have enough food!
rem     )

rem     echo.
rem     echo Goodbye World!

rem endlocal
rem goto :eof

rem E28 //Comparison Operators

    rem EQU - equal
    rem NEQ - not equal
    rem LSS - less than
    rem LEQ - less than or equal
    rem GTR - greater than
    rem GEQ - greater than or equal

rem goto :main


rem :main
rem     echo Hello!
rem     echo.

rem     set /a food = 12
rem     set /a needed_food = 15

rem     if %food% GEQ %needed_food% (
rem         echo we have enough food!
rem     ) else (
rem         echo Not enough food!
rem     )

rem     echo.
rem     echo Goodbye!

rem goto :eof

rem E29 //Else Statement
rem already mentioned in E28

rem E30 // If Nesting

rem goto :main


rem :main
rem setlocal

rem     set /a food=50
rem     set /a needed_food=50

rem     set /a people=10
rem     set /a rations=5
rem     set /a all_food=%people%*%rations%

rem     if %food% GEQ %needed_food% (
rem         echo We have a good amount of food!

rem         if %all_food% leq %food% (
rem             echo We have enough food for all %people% people!
rem         ) else (
rem             echo We don't have enough food for all these people!
rem         )

rem     ) else (
rem         echo we don't have enough food!
rem     )


rem endlocal
rem goto :eof

rem E31 //Delayed Virable Expansion
rem setlocal EnableDelayedExpansion
rem rem using ! instead of % after this expression
rem see: https://ss64.com/nt/delayedexpansion.html
rem goto :main


rem :main
rem setlocal

rem     echo Hello^^!
rem     echo.

rem     set /a food=50
rem     set /a needed_food=50

rem     set /a people=10
rem     set /a rations=5

rem     if !food! geq !needed_food! (
rem         echo We have a good amount of food!

rem         set /a all_food=!people!*!rations!

rem         if !all_food! leq !food! (
rem             echo We have enough food for all !people! people!
rem         ) else (
rem             echo We don't have enough food for all these people!
rem         )

rem     ) else (
rem         echo we don't have enough food!
rem     )


rem endlocal
rem goto :eof

:: further understanding of this

rem goto :main

rem :main

rem     set /a o1=2
rem     set /a o2=3

rem     set /a o3=%o1%*%o2%

rem     echo o3 is %o3%

rem     if %o2% lss 4 (

rem         set /a o4=%o1%*%o2%

rem         :: %o4% will be expanded to nothing 
rem         :: instead of %o1%%o2%, which intruduces
rem         :: an error, saying 10 was unexpected at this time.
rem         if %o4% lss 10 (
rem             echo o4 is %o4%
rem         )

rem     )

rem goto :eof

rem E32//"While Loop"

rem setlocal EnableDelayedExpansion

rem goto :main

rem :main
rem setlocal
rem     set /a counter=0
rem     set /a limit=100

rem     :loop
rem     if !counter! lss !limit! (
rem         echo !counter!
rem         set /a counter=!counter!+1

rem         goto :loop
rem     )

rem     echo counter is now !counter!

rem endlocal
rem goto :eof

rem E33//"For Loop"

rem setlocal EnableDelayedExpansion

rem goto :main

rem :main
rem setlocal

rem     set str=Hello World^^!
rem     echo !str!

rem     for %%g in (1 2 3 a b c) do (
rem         echo %%g
rem     )

rem endlocal
rem goto :eof

rem For through Numbers (start, step, end)
rem setlocal EnableDelayedExpansion

rem goto :main

rem :main
rem setlocal

rem     for /l %%g in (1,2,10) do (
rem         echo %%g
rem     )

rem endlocal
rem goto :eof

rem E35 //For through Directories

rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal
    
rem     for /d %%g in ( * ) do (
rem         echo %%g

rem     )

rem endlocal
rem goto :eof


rem E36 //For through files
rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal
    
rem     :: "s*" means things starting with 's'
rem     for /r %%g in ( s* ) do (
rem         echo %%g

rem     )

rem endlocal
rem goto :eof


rem E37// For through File Content
rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal
    
rem     :: "for through files" is based on columns(fields) separated
rem     :: by delimiters which is whitespace by default 
rem     :: use G H I J K ... to refer to consective columns 
        :: by default tokens=1
rem     for /f "tokens=1-9 delims=, skip=1" %%g in ( banks.csv ) do (
rem         echo %%g, whose last name is %%h

rem     )

rem endlocal
rem goto :eof


rem E39 For 'EOL' option

rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal
    
rem     :: in this case, "/" doesn't exist, therefore the
rem     :: the actual working delimter is newline character

rem     :: eol=# will skip lines starting with "#"
rem     for /f "delims=/ eol=#"  %%g in ( banks.csv ) do (
rem         echo %%g 

rem     )

rem endlocal
rem goto :eof


rem E40  For Command Output

rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal
   
rem    :: print output of 'cd' command
rem     for /f "delims=\" %%g in ( 'cd' ) do (
rem         echo %%g 

rem     )

rem endlocal
rem goto :eof

rem E41 //For through string
rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal

rem     set str=This is a nice sentece
   
rem    :: print output of 'cd' command
rem     for /f "tokens=1-9" %%g in ( "!str!" ) do (
rem         echo %%g %%h %%i %%j

rem     )

rem endlocal
rem goto :eof


rem E42 Breakin' outta the For Loop
rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal

rem     for /l %%g in (1,1, 10) do (
rem         if %%g equ 5 (
rem             goto :loop_end
rem         )
rem         echo %%g
rem     )       
rem     :loop_end
rem     echo.
rem     echo End of loop^^!

rem endlocal
rem goto :eof

rem E43 //Redirection

rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal

rem     ::stdout 1 (default)
rem     ::stderr 2

rem     :: point stdout to new_file.txt, and then point 
rem     :: stderr to stdout, thus stdout/stderr both
rem     :: would be written into new_file.txt  
rem     dir /b > new_file.txt 2>&1 

rem endlocal
rem goto :eof


rem E44 More Redirection(">>" vs ">")

rem setlocal EnableDelayedExpansion

rem goto :main

rem :main
rem setlocal

rem     echo Anything we want^^! >> new_file.txt
rem     echo This is hilarious^^! >> new_file.txt

rem endlocal
rem goto :eof

rem E45 Some More Reidrection
:: direct file input to command

rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal

rem     set file_name=new_file.txt

rem     echo y>!file_name!
rem     choice <!file_name!

rem endlocal
rem goto :eof

rem E46 //Even More Redirection
:: pipe "|"

rem setlocal EnableDelayedExpansion
rem goto :main

rem :main
rem setlocal

rem     echo y|choice
    
rem goto :eof

rem E47 Working with folders

:: mkdir/md folder -> make a folder
:: rmdir folder -> delete an empty folder
:: rmdir /s folder -> delete a folder and content in it with confirmation
:: rmdir /s /q folder -> delete a folder and content in it without confirmation(quietly)

:: echo y|rmdir /s folder 
:: which perform the same process with 
:: rmdir /s /q folder

rem E48 Moving and Renaming

:: To move one or more files:
:: MOVE [/Y | /-Y] [drive:][path]filename1[,...] destination

:: To rename a directory:
:: MOVE [/Y | /-Y] [drive:][path]dirname1 dirname2

:: DEFAULT OVERWRITE WARNING!


rem E49//Copying Files
