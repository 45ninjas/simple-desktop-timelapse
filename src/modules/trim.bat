CALL %~dp0../timestamp.bat
CALL %~dp0../project-conf.bat

:: Get the start time
if "%~2" == "" (
	echo Start time not set
	goto end
)
set /a START_TIME = %~2
if "%~2" == "start" (
	set START_TIME = 0
)

:: Verify the input file.
if "%~4" == "" (
	echo Input file not provided.
	goto end
)
if not exist %~4 (
	echo Input file not found.
	goto end
)

:: Get the end time
if "%~3" == "" (
	echo End time not set
	goto end
)
set /a END_TIME = %~3
if "%~3" == "end" (
	ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "%~4"> .timeprobe
	set /p END_TIME=<.timeprobe
	del .timeprobe
)


echo START_TIME: %START_TIME%
echo END_TIME: %END_TIME%

::ffmpeg %CONF_FFMPEG_PREFIX% -ss %START_TIME% -i %~4 -c copy -to %END_TIME% trim-%TIME_STAMP%.%CONF_VIDEO_FORMAT%

:end