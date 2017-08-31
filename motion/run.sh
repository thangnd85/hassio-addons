#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

CONFIG=$(jq --raw-output ".config" $CONFIG_PATH)
VIDEODEVICE=$(jq --raw-output ".videodevice" $CONFIG_PATH)
WIDTH=$(jq --raw-output ".width" $CONFIG_PATH)
HEIGHT=$(jq --raw-output ".height" $CONFIG_PATH)
FRAMERATE=$(jq --raw-output ".framerate" $CONFIG_PATH)
TEXTRIGHT=$(jq --raw-output ".text_right" $CONFIG_PATH)
TARGETDIR=$(jq --raw-output ".target_dir" $CONFIG_PATH)
SNAPSHOTINTERVAL=$(jq --raw-output ".snapshot_interval" $CONFIG_PATH) #0
SNAPSHOTNAME=$(jq --raw-output ".snapshot_name" $CONFIG_PATH) #%v-%Y%m%d%H%M%S-snapshot
PICTURENAME=$(jq --raw-output ".picture_name" $CONFIG_PATH) #%v-%Y%m%d%H%M%S-%q
STREAMPORT=$(jq --raw-output ".stream_port" $CONFIG_PATH) # 8081
STREAMLOCALONLY=$(jq --raw-output ".stream_local_only" $CONFIG_PATH) # on/off


echo "[Info] Show connected usb devices"
lsusb
ls -al /dev/video*

if [ ! -f "$CONFIG" ]; then
	sed -i "s/%%VIDEODEVICE%%/$VIDEODEVICE/g" /etc/motion.conf
	sed -i "s/%%WIDTH%%/$WIDTH/g" /etc/motion.conf
	sed -i "s/%%HEIGHT%%/$HEIGHT/g" /etc/motion.conf
	sed -i "s/%%FRAMERATE%%/$FRAMERATE/g" /etc/motion.conf
	sed -i "s/%%TEXTRIGHT%%/$TEXTRIGHT/g" /etc/motion.conf
	sed -i "s/%%TARGETDIR%%/$TARGETDIR/g" /etc/motion.conf
	sed -i "s/%%SNAPSHOTINTERVAL%%/$SNAPSHOTINTERVAL/g" /etc/motion.conf
	sed -i "s/%%SNAPSHOTNAME%%/$SNAPSHOTNAME/g" /etc/motion.conf
	sed -i "s/%%PICTURENAME%%/$PICTURENAME/g" /etc/motion.conf
	sed -i "s/%%STREAMPORT%%/$STREAMPORT/g" /etc/motion.conf
	sed -i "s/%%STREAMLOCALONLY%%/$STREAMLOCALONLY/g" /etc/motion.conf
	CONFIG=/etc/motion.conf
fi
# start server
exec motion -c $CONFIG < /dev/null
