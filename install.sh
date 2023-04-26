#!/bin/bash
echo "Install.sh"


#check if  a symbolic link to the file ~/Gab3d-Klipper-Utilities/gab-3d-utilities.cfg in /home/pi/printer_data/config/ exist if not create it
if [ -L /home/pi/printer_data/config/gab-3d-utilities.cfg ]; then
  echo "a symbolic link to the file ~/Gab3d-Klipper-Utilities/gab-3d-utilities.cfg in /home/pi/printer_data/config/ already exists"
else
  echo "a symbolic link to the file ~/Gab3d-Klipper-Utilities/gab-3d-utilities.cfg in /home/pi/printer_data/config/ does not exist, creating it now"
  ln -s ~/Gab3d-Klipper-Utilities/gab-3d-utilities.cfg /home/pi/printer_data/config/gab-3d-utilities.cfg
fi

#check if '[include gab-3d-utilities.cfg]' exists in the file /home/pi/printer_data/config/printer.cfg if not prepend it
if grep -q '\[include gab-3d-utilities.cfg\]' /home/pi/printer_data/config/printer.cfg; then
  echo "'[include gab-3d-utilities.cfg]' already exists in /home/pi/printer_data/config/printer.cfg"
else
  echo "'[include gab-3d-utilities.cfg]' does not exist in /home/pi/printer_data/config/printer.cfg, adding it now"
  sed -i '1s/^/[include gab-3d-utilities.cfg]\n/' /home/pi/printer_data/config/printer.cfg
fi


#restart klipper
sudo service klipper restart
#restart moonraker
sudo service moonraker restart 


  