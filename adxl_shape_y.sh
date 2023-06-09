#!/bin/bash
# Originally made by Insane78 https://github.com/insane78/
# Modified by Gab3d

#check if ~/printer_data/config/shaper/ exists if not create it
if [ ! -d ~/printer_data/config/shaper/ ]; then
  echo "shaper directory does not exist, creating it now"
  mkdir ~/printer_data/config/shaper/
fi

rundate=$(date +%Y%m%d-%H%M)


~/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_y_*.csv -o ~/printer_data/config/shaper/"$rundate"_Y.png

echo "your shaper calibration is ready in ~/printer_data/config/shaper/"$rundate"_Y.png"
