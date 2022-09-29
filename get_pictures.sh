#!/bin/sh
if pidof -o %PPID -x "Get_pictures.sh"; then 
	exit 1 
fi 
	rclone sync piPepeCloud:/fakeDrops /home/pi/Pictures 
        sudo kill `pgrep -f "fbi"`
	/home/pi/fbi_start.sh

exit
