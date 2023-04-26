#!/bin/bash
echo "running Install.sh"
sudo apt update

sudo apt install python3-numpy python3-matplotlib libatlas-base-dev

#check numpy is installed in ~/klippy-env/bin/pip if not install it
if ~/klippy-env/bin/pip list | grep -q 'numpy'; then
  echo "numpy is already installed in ~/klippy-env/bin/pip"
else
  echo "numpy is not installed in ~/klippy-env/bin/pip, installing it now"
  ~/klippy-env/bin/pip install -v numpy
fi


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


#check if the string 'Gab3d-Klipper-Utilities.git' exists in the file /home/pi/printer_data/config/moonraker.conf
if grep -q 'Gab3d-Klipper-Utilities.git' /home/pi/printer_data/config/moonraker.conf; then
  echo "Gab3d-Klipper-Utilities.git already exists in /home/pi/printer_data/config/moonraker.conf"
else
  #append the string 'Gab3d-Klipper-Utilities.git' to the file /home/pi/printer_data/config/moonraker.conf
    echo "Gab3d-Klipper-Utilities.git does not exist in /home/pi/printer_data/config/moonraker.conf, adding it now"
    echo  "

[update_manager Gab3d-Klipper-Utilities]
type: git_repo
channel: dev
primary_branch: main
path: ~/Gab3d-Klipper-Utilities
origin: https://github.com/gab-3d/Gab3d-Klipper-Utilities.git
install_script: install.sh
    " >> /home/pi/printer_data/config/moonraker.conf
fi

#check if the string 'gab-3d-utilities.cfg' exists in the file /home/pi/printer_data/moonraker.asvc if not append it
if grep -q 'gab-3d-utilities.cfg' /home/pi/printer_data/moonraker.asvc; then
  echo "gab-3d-utilities.cfg already exists in /home/pi/printer_data/moonraker.asvc"
else
  #append the string 'gab-3d-utilities.cfg' to the file /home/pi/printer_data/moonraker.asvc
    echo "gab-3d-utilities.cfg does not exist in /home/pi/printer_data/moonraker.asvc, adding it now"
    echo  "gab-3d-utilities.cfg" >> /home/pi/printer_data/moonraker.asvc
fi

#restart klipper
service klipper restart
#restart moonraker
service moonraker restart 


  