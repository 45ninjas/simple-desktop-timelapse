:: Get the timestamp
CALL %~dp0../timestamp.bat
CALL %~dp0../project-conf.bat

if "%~2" == "" (
	echo Target time not provided
	goto end
)

if "%~3" == "" (
	echo Input file not provided.
	goto end
)
if not exist %~3 (
	echo Input file not found.
	goto end
)

set /a TARGET_TIME = %~2

:: Find out how long the provided video is
ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %~3> .timeprobe
set /p TOTAL_TIME=<.timeprobe
del .timeprobe

:: Merge them all together.
ffmpeg %CONF_FFMPEG_PREFIX% -i %~3 -filter:v "setpts=(%TARGET_TIME%/%TOTAL_TIME%)*PTS" -an target-%TIME_STAMP%.%CONF_VIDEO_FORMAT%

:end