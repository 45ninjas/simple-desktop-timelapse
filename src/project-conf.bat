set CONF_RECORD_FPS =
set CONF_VIDEO_FPS =
set CONF_VIDEO_FORMAT =
set CONF_RECORD_WHOLE_INPUT =
set CONF_RECORD_SIZE =
set CONF_RECORD_X_OFFSET =
set CONF_RECORD_Y_OFFSET =
set CONF_FFMPEG_PREFIX =

:: Parse the project file if it exist
if exist project.ini (

	FOR /F "tokens=1,2 delims==" %%a in (project.ini) DO (
		if "%%a" == "record fps" set CONF_RECORD_FPS=%%b
		if "%%a" == "video fps" set CONF_VIDEO_FPS=%%b
		if "%%a" == "video format" set CONF_VIDEO_FORMAT=%%b
		if "%%a" == "record whole input" set CONF_RECORD_WHOLE_INPUT=%%b
		if "%%a" == "record size" set CONF_RECORD_SIZE=%%b
		if "%%a" == "record x offset" set CONF_RECORD_X_OFFSET=%%b
		if "%%a" == "record y offset" set CONF_RECORD_Y_OFFSET=%%b
		if "%%a" == "ffmpeg prefix" set CONF_FFMPEG_PREFIX=%%b
	)
)