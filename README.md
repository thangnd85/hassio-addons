# Hass.io Addons repository

## Motion Addon - WORK IN PROGRESS
Addon to use a usb camera with motion detection, based on https://motion-project.github.io/

### Current status
Webcam is recognized, but only outputs an gray image.

```
[1] cap.driver: “ov534”
[1] cap.card: “USB Camera-B4.09.24.1”
[1] cap.bus_info: “usb-3f980000.usb-1.2”
[1] cap.capabilities=0x85200001
[1] - VIDEO_CAPTURE
[1] - READWRITE
[1] - STREAMING
[1] Unable to query input -1 VIDIOC_ENUMINPUT: Invalid argument
[1] ioctl (VIDIOCGCAP): Not a tty
```

### Settings
##### config
*Optional*

Path to a predefined motion.conf settings file

##### videodevice
*/dev/video0*

##### width
*640*

Image width (pixels). Valid range: Camera dependent

##### height
*480*

Image height (pixels). Valid range: Camera dependent

##### framerate
*2*

Maximum number of frames to be captured per second.  
Valid range: 2-100. Default: 100 (almost no limit).

##### text_right
*%Y-%m-%d %T-%q*


Draws the timestamp using same options as C function strftime(3)  
Text is placed in lower right corner

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### target_dir
*/share/motion*

Target base directory for pictures and films  
Use absolute path.

##### snapshot_interval
*60*

Make automated snapshot every N seconds (0 = disabled)

##### snapshot_name
*%v-%Y%m%d%H%M%S-snapshot*


File path for snapshots (jpeg or ppm) relative to target_dir  
Default value is equivalent to legacy oldlayout option  
For Motion 3.0 compatible mode choose: %Y/%m/%d/%H/%M/%S-snapshot  
File extension .jpg or .ppm is automatically added so do not include this.  
Note: A symbolic link called lastsnap.jpg created in the target_dir will always point to the latest snapshot, unless snapshot_filename is exactly 'lastsnap'

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### picture_name
*%v-%Y%m%d%H%M%S-%q*

File path for motion triggered images (jpeg or ppm) relative to target_dir  
Default value is equivalent to legacy oldlayout option  
For Motion 3.0 compatible mode choose: %Y/%m/%d/%H/%M/%S-%q  
File extension .jpg or .ppm is automatically added so do not include this  
Set to 'preview' together with best-preview feature enables special naming convention for preview shots. See motion guide for details

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### stream_port
*0*

The mini-http server listens to this port for requests (0 = disabled)

##### stream_local_only
*on*

Restrict stream connections to localhost only
