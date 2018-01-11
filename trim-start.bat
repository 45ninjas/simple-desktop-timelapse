@echo off

rem		Chop up the date and time variables to make a 'yyyy-mm-dd-hh-mm' time stamp.
set TIME_STAMP=%date:~10,4%-%date:~7,2%-%date:~4,2%-%time:~0,2%-%time:~3,2%

set /P FILE=File to modify [drag'n'drop]:

set /P SECONDS=Seconds from start: 

@echo on
ffmpeg -i %FILE% -ss %SECONDS% -c copy trim-start-%TIME_STAMP%.mkv
pause;