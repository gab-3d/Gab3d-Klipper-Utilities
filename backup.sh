#!/bin/bash
# This script is used to backup a user's /home/pi/printer_data/config directory to /home/pi/printer_data/config/backup
# It also backup can0 configuration
# It also backup /home/pi/printer_data/gcode directory to /home/pi/printer_data/config/backup


#check if /home/pi/printer_data/config/backup exists if not create it
if [ ! -d /home/pi/printer_data/config/backup ]; then
  echo "backup directory does not exist, creating it now"
  mkdir /home/pi/printer_data/config/backup
fi

#check if zip is installed if not install it
if [ ! -f /usr/bin/zip ]; then
  echo "zip is not installed, installing it now"
  sudo apt-get install zip -y
fi


#create a variable backupdate with a string rapresenting the current date and time in minutes separated by minus
backupdate=$(date +%Y%m%d-%H%M)
echo $backupdate
#zip /home/pi/printer_data/config directory to a file named hostname-date.zip
zip -r /home/pi/printer_data/config/backup/$(hostname)-$backupdate.zip /home/pi/printer_data/config

#add /etc/network/interfaces.d/can0
zip -r /home/pi/printer_data/config/backup/$(hostname)-$backupdate.zip /etc/network/interfaces.d/can0
