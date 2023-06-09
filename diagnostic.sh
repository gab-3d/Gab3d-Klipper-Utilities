#!/bin/bash

#Made by Gab3d

rm ~/printer_data/config/backup/*.log

# save in a file all the rows after the last occurrence of 'Start printer at' in the file ~/printer_data/logs/klippy.log
tail -n $(($(tac ~/printer_data/logs/klippy.log | grep -m 1 -n 'Start printer at' | cut -d ":" -f 1)-1)) ~/printer_data/logs/klippy.log > ~/printer_data/config/backup/$(hostname)-diag_klippy.log

# save in a file all the rows after the last occurrence of '--------------------Moonraker Log Start--------------------' in the file ~/printer_data/logs/moonraker.log
tail -n $(($(tac ~/printer_data/logs/moonraker.log | grep -m 1 -n 'Moonraker Log Start' | cut -d ":" -f 1)-1)) ~/printer_data/logs/moonraker.log > ~/printer_data/config/backup/$(hostname)-diag_moonraker.log

# save in a file all the rows after the last occurrence of 'KlipperScreen Log Start' in the file ~/printer_data/logs/KlipperScreen.log
tail -n $(($(tac ~/printer_data/logs/KlipperScreen.log | grep -m 1 -n 'KlipperScreen Log Start' | cut -d ":" -f 1)-1)) ~/printer_data/logs/KlipperScreen.log > ~/printer_data/config/backup/$(hostname)-diag_KlipperScreen.log

# save in a file all the rows after the last occurrence of 'crowsnest: crowsnest' in the file ~/printer_data/logs/crowsnest.log
tail -n $(($(tac ~/printer_data/logs/crowsnest.log | grep -m 1 -n 'crowsnest: crowsnest' | cut -d ":" -f 1)-1)) ~/printer_data/logs/crowsnest.log > ~/printer_data/config/backup/$(hostname)-diag_crowsnest.log

ls /dev/serial/by-id/ > ~/printer_data/config/backup/$(hostname)-serial-by-id.log
lsusb > ~/printer_data/config/backup/$(hostname)-lsusb.log
lsusb -t > ~/printer_data/config/backup/$(hostname)-lsusb-t.log

lsb_release -a > ~/printer_data/config/backup/$(hostname)-lsb_release.log
uname -a > ~/printer_data/config/backup/$(hostname)-uname.log
cat /etc/os-release > ~/printer_data/config/backup/$(hostname)-os-release.log



logdate=$(date +%Y%m%d-%H%M)

if [ -f /etc/network/interfaces.d/can0 ]; then
    zip -j ~/printer_data/config/backup/diagnostic-"$logdate".zip /etc/network/interfaces.d/can0
    ~/klippy-env/bin/python ~/klipper/scripts/canbus_query.py can0 > ~/printer_data/config/backup/$(hostname)-canbus_query.log
fi
zip -j ~/printer_data/config/backup/diagnostic-"$logdate".zip ~/printer_data/config/*.conf
zip -j ~/printer_data/config/backup/diagnostic-"$logdate".zip ~/printer_data/config/backup/*.log


#delete *.log in ~/printer_data/config/backup/
rm ~/printer_data/config/backup/*.log

echo "your diagnostics are ready in ~/printer_data/config/backup/diagnostic-$logdate.zip"
