# Tom's FFmpeg Time-lapse Scripts

This collection of scripts produce and edit time-lapses of a windows desktop without having the hassle of images in the tens of thousands. **Directly from your desktop to a video file.**

## Example

<a href="http://www.youtube.com/watch?feature=player_embedded&v=vdX6Fxp3Pzg
" target="_blank"><img src="http://img.youtube.com/vi/vdX6Fxp3Pzg/0.jpg" 
alt="Example Video" width="240" height="180" border="10" /></a>

## Installation

1. Make sure a modern version of **FFmpeg** is installed.
2. Make sure it's in your **path variable** so you can type `ffmpeg` and `ffprobe` directly into the command prompt.
3. Clone or download this project and add it to the **path variable**. So you can type `tts` in command prompt.

## Creating Your First Project

 	1. Create a new directory for your project.
 	2. CD into that directory with command prompt.
 	3. type `tss init`. This will create the directory structure and a file called *project.ini*
 	4. Configure the project by editing the parameters in the *project.ini* file. By default it's setup to record a 1080x1920 video with an offset of 0,0. You will want to change this if you are not using a 1080p monitor.
 	5. type `tss record` to begin a new time-lapse clip of your desktop.
 	6. Press `Q` to finish a recording. Start more recordings if required.
 	7. Now we have multiple recordings in the *recordings* folder. To merge them into one singe file type `tss merge`.
 	8. If your recordings are too long typing `tss target 600 <your video file here>` will spit out a precisely 600 seconds long video.

## Modules

All commands but `init` and `help` have been created with these modules. The`/src/modules.ini` file and `/src/modules/` directory is where all the are kept. If you want to add a new one to add audio for example just duplicate an existing one and hack away. ~~Documentation on modules available here.~~

### Default/Included Modules
