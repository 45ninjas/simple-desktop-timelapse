:: Get the timestamp
CALL %~dp0../timestamp.bat
CALL %~dp0../project-conf.bat
:: Create a text file containing everything in the recordings file.

::del merge-list.txt

(for %%i in (recordings/*.%CONF_VIDEO_FORMAT%) do @echo file 'recordings/%%i') > merge-list.txt

:: Merge them all together.
ffmpeg %CONF_FFMPEG_PREFIX% -f concat -i merge-list.txt -c copy merge-%TIME_STAMP%.%CONF_VIDEO_FORMAT%