@ECHO off
cls
echo ----------------------------------------
ECHO    batch for nrfutil - P8 (batchScript)
ECHO    Back to Dafit Stock FW
ECHO    by dapgo20201222 
ECHO    https://github.com/dapgo/
echo ----------------------------------------


rem Debugging Info Log: 1 (default verbose mode)
rem 0 min, 1 default,... 4 max 
SET V_DEBUG=1

:MENU
echo -----------------------------

IF %V_DEBUG% GTR 0  ECHO Debug1: Run from batch folder:  %CD%

echo -----------------------------
ECHO 1) Launch nrfutil help+version
ECHO 2) Launch nrfutil keys generate
ECHO 3) Launch nrfutil pkg generate
ECHO 4) free
ECHO 5) free
ECHO 6) Clear Screen/history
ECHO 7) Quit
rem openocd --version

rem CHOICE.EXE
CHOICE /C 1234567
IF %ERRORLEVEL% == 1 GOTO SECTION1
IF %ERRORLEVEL% == 2 GOTO SECTION2
IF %ERRORLEVEL% == 3 GOTO SECTION3
IF %ERRORLEVEL% == 4 GOTO SECTION4
IF %ERRORLEVEL% == 5 GOTO SECTION5
IF %ERRORLEVEL% == 6 GOTO SECTION6
IF %ERRORLEVEL% == 7 GOTO FIN


:SECTION1
REM ************** SECTION 1 **********
.\nrfutil.exe  --help
.\nrfutil version
pause
GOTO FIN

:SECTION2
REM ************** SECTION 2 **********
@echo off
SET V_FILENAME1=myprivate.key
IF %V_DEBUG% GTR 1 ECHO ECHO ON
nrfutil keys generate %V_FILENAME1%
pause
GOTO FIN


:SECTION3
REM ************** SECTION 3 **********
@echo off
ECHO **********  ************
SET V_FILE1=MOY-TIN5-1.8.2.bin
SET V_FILE2=myprivate.key
SET V_FILE3=p8stock_tin5.zip
SET V_HW=52
SET V_SD_FWID=0x9D


IF %V_DEBUG% GTR 0 (
	ECHO ****Parameters for next command:
	ECHO V_FILE1=%V_FILE1%
	ECHO V_FILE2=%V_FILE2%
	ECHO V_FILE3=%V_FILE3%
	ECHO V_HW=%V_HW%
	ECHO V_SD_FWID=%V_SD_FWID%
)

ECHO "** Check the param values and continue or cancel/close **"
pause 

IF %V_DEBUG% GTR 0 ECHO ECHO ON

nrfutil.exe -v pkg generate --hw-version %V_HW% --application-version 1 --application %V_FILE1% --sd-req %V_SD_FWID% --key-file %V_FILE2% %V_FILE3%

@echo off

pause
GOTO FIN

:SECTION4
REM ************** SECTION 4 **********
ECHO ******* EMPTY *******
pause
GOTO FIN

:SECTION5  
REM ************** SECTION 5 ***********
REM **************  **************  **************
ECHO **********  ************
ECHO ******* EMPTY *******
IF %V_DEBUG% GTR 1 ECHO ECHO ******* EMPTY *******
pause
GOTO FIN

:SECTION6  
REM ************** ***********
REM ************** SECTION 6***********
REM **************  **************  **************
cls
pause
GOTO FIN


@echo OFF
echo -----------------------------

pause

:FIN
rem fake END
Echo "type to go back to MENU"
GOTO MENU