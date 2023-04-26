# Gab3d Klipper Utilities
 
To install it open a shell prompt (ssh or putty)
run
```shell
cd ~
git clone https://github.com/gab-3d/Gab3d-Klipper-Utilities.git && sudo bash ~/Gab3d-Klipper-Utilities/install.sh
```

# Utilities included

## Backup klipper

It does a backup of
- ~/printer_data/config
- /etc/network/interfaces.d/can0

it save output under backup folder in config with hostname and the date

## Generate png of input shaper results and install all requirements
Thanks to [Insane](https://github.com/insane78/) for developing these scripts

- GRAPH_SHAPER_XY
- GRAPH_SHAPER_X
- GRAPH_SHAPER_Y


## Hidden macro _UPDATE_GAB_UTIL
The macro _UPDATE_GAB_UTIL run the installation script again