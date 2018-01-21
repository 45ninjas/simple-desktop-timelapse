@echo off
setlocal EnableDelayedExpansion

:: Parse the arguments/commands.

:: Help commands first.
IF "%~1" == "/h" GOTO help-text
IF "%~1" == "-h" GOTO help-text
IF "%~1" == "help" GOTO help-text

:: Project init
IF "%~1" == "init" GOTO new-project

set /a grab = -1
set MODULE_FILE =""
:: Read the modules.ini file and figure out if the use wants to use one.
FOR /F "tokens=1,2 delims==" %%a in (%~dp0src\modules.ini) DO (
	set key=%%a
	set value=%%b

	IF NOT !grab! == -1 (
		IF "!key!"=="file" (
			set MODULE_FILE=!value!
		)
	)

	IF "!key:~0,1!" == "[" (
		set /a grab = -1
		IF "%~1" == "!key:~1,-1!" (
			set /a grab = 1
		)
	)
)

:: If a module was found to match, execute it.
IF NOT "%MODULE_FILE%" == "" GOTO execute-module

IF "%~1" == "" GOTO help-text

GOTO end


:help-text
echo TTS help
echo.
echo Usage: tts [command]
echo.
echo [32mTODO: Add some usefull help text.[0m
echo.
echo init
echo		Creates a new project in the curent working directory (cd).
echo help
echo		Shows this page.

set command = ""
set usage_text = ""
set help_text = ""
:: Read the modules.ini file.
FOR /F "tokens=1,2 delims==" %%a in (%~dp0src\modules.ini) DO (
	set key=%%a
	
	IF "!key:~0,1!" == "[" (

		if not "!command!" == "" (
			echo !command!
			echo		!help_text!
			if not "!usage_text!" == "" echo 	Usage: !usage_text!

			set usage_text = ""
			set help_text = ""
		)

	 	set command=!key:~1,-1!
	)
	IF "!key!"=="help-text" (
		set help_text=%%b
	)
	IF "!key!"=="usage-text" (
		set usage_text=%%b
	)
)
echo %command%
echo		%help_text%
if not "!usage_text!" == "" echo 	Usage: %usage_text%

GOTO end

:: Create a new porject.
:new-project
	IF exist project.ini (
		echo A project already exists in this directory.
		exit /b 1
	)

	copy %~dp0src\default-project.ini project.ini
	mkdir recordings
GOTO end

:execute-module
	CALL %~dp0src\%MODULE_FILE% %*
GOTO end

:end