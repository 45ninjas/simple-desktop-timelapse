@echo off
echo "This script will speed up or slow down the video to match a targeted time."

rem		Chop up the date and time variables to make a 'yyyy-mm-dd-hh-mm' time stamp.
set TIME_STAMP=%date:~10,4%-%date:~7,2%-%date:~4,2%-%time:~0,2%-%time:~3,2%

set /P FILE=File to modify [drag'n'drop]:

ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %FILE%> tmp.tmp
set /p SECONDS=<tmp.tmp
del tmp.tmp

echo Total seconds: %SECONDS%
set /P TARGET_SECONDS=Target seconds: 

@echo on
ffmpeg -i %FILE% -filter:v "setpts=(%TARGET_SECONDS%/%SECONDS%)*PTS" -an target-time-%TIME_STAMP%.mkv