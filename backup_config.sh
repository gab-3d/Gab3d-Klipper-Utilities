#!/bin/bash

# Made by Gab3d


#check if ~/printer_data/config/backup exists if not create it
if [ ! -d ~/printer_data/config/backup ]; then
  echo "backup directory does not exist, creating it now"
  mkdir ~/printer_data/config/backup
fi




#create a variable backupdate with a string rapresenting the current date and time in minutes separated by minus
backupdate=$(date +%Y%m%d-%H%M)
#zip ~/printer_data/config directory to a file named hostname-date.zip and exclude .git directory
zip -r ~/printer_data/config/backup/$(hostname)-$backupdate.zip ~/printer_data/config -x "**/backup/**" "**/.git/**" 

#check if /etc/network/interfaces.d/can0 exists if yes add it to the backup
if [ -f /etc/network/interfaces.d/can0 ]; then
  echo "can0 configuration found, adding it to the backup"
  zip -r ~/printer_data/config/backup/$(hostname)-$backupdate.zip /etc/network/interfaces.d/can0
fi

#list untracked git files in ~/klipper/klippy/extras and add them to the backup
untracked=$(git -C ~/klipper/klippy/extras ls-files --others --exclude-standard)
if [ -n "$untracked" ]; then
  echo "untracked files found in ~/klipper/klippy/extras, adding them to the backup"
  #concatenate '~/klipper/klippy/extras/' to the beginning of each line of the variable untracked
  untracked=$(echo "$untracked" | sed  -e 's/^/~\/klipper\/klippy\/extras\//')
  echo "$untracked"
  zip ~/printer_data/config/backup/$(hostname)-$backupdate.zip $untracked
fi


zip -r ~/printer_data/config/backup/$(hostname)-$backupdate.zip ~/printer_data/moonraker.asvc
echo "your backup is ready in ~/printer_data/config/backup/$(hostname)-$backupdate.zip"

