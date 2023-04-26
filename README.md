# Gab3d Klipper Utilities
 
To install it open a shell prompt (ssh or putty)

Use Kiauh to install shell command

- option 4 (Advanced)
- option 8 (G-Code Shell Command)

than run these 3 lines

```shell
cd ~
git clone https://github.com/gab-3d/Gab3d-Klipper-Utilities.git
bash ~/Gab3d-Klipper-Utilities/install.sh
```

# Utilities included

## Backup klipper

It does a backup of
- ~/printer_data/config -- Excluding zip archives
- /etc/network/interfaces.d/can0
- ~/printer_data/moonraker.asvc

it save output under backup folder in config with hostname and the date in a zip file
I choose this directory because is simple to delete files and download 

## Generate png of input shaper results and install all requirements
Thanks to [Insane](https://github.com/insane78/) for developing these scripts

- GRAPH_SHAPER_XY
- GRAPH_SHAPER_X
- GRAPH_SHAPER_Y

## PID helper
- PID_HOTEND
- PID_BED
## Generate diagnostic files

Generate a collection of log files usefull to debug
the macro is DIAG_CREATE 

## Hidden macro _UPDATE_GAB_UTIL
The macro _UPDATE_GAB_UTIL run the installation script again
