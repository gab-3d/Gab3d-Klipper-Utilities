sudo apt update

sudo apt install python3-numpy python3-matplotlib libatlas-base-dev

#check numpy is installed in ~/klippy-env/bin/pip if not install it
if ~/klippy-env/bin/pip list | grep -q 'numpy'; then
  echo "numpy is already installed in ~/klippy-env/bin/pip"
else
  echo "numpy is not installed in ~/klippy-env/bin/pip, installing it now"
  ~/klippy-env/bin/pip install -v numpy
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








bash ~/Gab3d-Klipper-Utilities/install.sh
