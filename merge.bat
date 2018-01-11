@echo off
rem		This simple batch script will merge all MKV files in the merge directory.

rem		Chop up the date and time variables to make a 'yyyy-mm-dd-hh-mm' time stamp.
set TIME_STAMP=%date:~10,4%-%date:~7,2%-%date:~4,2%-%time:~0,2%-%time:~3,2%

@echo # Generated %TIME_STAMP% > merge-list.txt

(for %%i in (record**.mkv) do @echo file '%%i') >> merge-list.txt

ffmpeg -f concat -i merge-list.txt -c copy merge-%TIME_STAMP%.mkv