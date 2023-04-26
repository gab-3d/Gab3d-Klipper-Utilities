#!/bin/bash
# This script is used to backup a user's ~/printer_data/config directory to ~/printer_data/config/backup
# It also backup can0 configuration
# It also backup ~/printer_data/gcode directory to ~/printer_data/config/backup


#check if ~/printer_data/config/backup exists if not create it
if [ ! -d ~/printer_data/config/backup ]; then
  echo "backup directory does not exist, creating it now"
  mkdir ~/printer_data/config/backup
fi




#create a variable backupdate with a string rapresenting the current date and time in minutes separated by minus
backupdate=$(date +%Y%m%d-%H%M)
echo $backupdate
#zip ~/printer_data/config directory to a file named hostname-date.zip and exclude .git directory
zip -r ~/printer_data/config/backup/$(hostname)-$backupdate.zip ~/printer_data/config -x \.git\*

#add /etc/network/interfaces.d/can0
zip -r ~/printer_data/config/backup/$(hostname)-$backupdate.zip /etc/network/interfaces.d/can0

zip -r ~/printer_data/config/backup/$(hostname)-$backupdate.zip ~/printer_data/moonraker.asvc

