CALL %~dp0../timestamp.bat
CALL %~dp0../project-conf.bat

echo [101;93m Press 'Q' to stop recording [0m

ffmpeg %CONF_FFMPEG_PREFIX% -f gdigrab -framerate %CONF_RECORD_FPS% -offset_x %CONF_RECORD_X_OFFSET% -offset_y %CONF_RECORD_Y_OFFSET% -video_size %CONF_RECORD_SIZE% -i desktop -vf settb=expr=1/%CONF_VIDEO_FPS%,setpts=N/TB/%CONF_VIDEO_FPS% -r %CONF_VIDEO_FPS% recordings/%TIME_STAMP%.%CONF_VIDEO_FORMAT%

echo 
echo [101;93m Recording stopped [0m