@echo off
rem		This simple batch script will record your desktop at 4 frames every second
rem		and stuff it into a 60 fps video.
rem		Essentially, desktop time lapses without dealing with thousands of images
rem		or ridiculously large files.

rem		You will have to modify this script if you don't have a 1440p display as
rem		your primary display.



rem		Chop up the date and time variables to make a 'yyyy-mm-dd-hh-mm' time stamp.
set TIME_STAMP=%date:~10,4%-%date:~7,2%-%date:~4,2%-%time:~0,2%-%time:~3,2%

rem		use gdigrab to get the desktop at 4 fps, crop it to 1440p (screen size).
rem		next, set the timebase (frame rate) for the output video to 60 fps. and
rem		do the same for the presentation timestamp. Set the actual fps
rem		to 60 fps and finally set name the file 'desktop-yyyy-mm-dd-hh-mm.mkv.'
ffmpeg -f gdigrab -framerate 4 -video_size 2560x1440 -i desktop -vf settb=expr=1/60,setpts=N/TB/60 -r 60 record-%TIME_STAMP%.mkv