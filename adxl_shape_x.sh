#!/bin/bash

#check if ~/printer_data/config/shaper/ exists if not create it
if [ ! -d ~/printer_data/config/shaper/ ]; then
  echo "shaper directory does not exist, creating it now"
  mkdir ~/printer_data/config/shaper/
fi

~/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_x_*.csv -o ~/printer_data/config/shaper/ultima_calibrazione_X.png