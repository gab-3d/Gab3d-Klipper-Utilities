#!/bin/bash

#Made by Gab3d

#check if ~/moonrake-telegram-bot-timelapse/ is present and delete all the content including subirectories
if [ -d ~/moonraker-telegram-bot-timelapse/ ]; then
    rm -rf ~/moonraker-telegram-bot-timelapse/*
fi

#remove old packages from apt cache
sudo apt-get clean
