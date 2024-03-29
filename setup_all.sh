#!/bin/bash

#setup all three

sudo apt-get install -y python-wxgtk3.0
sudo apt-get install -y matchbox-keyboard
sudo apt-get install screen
sudo apt-get install python-pip
sudo apt-get python-rpi.gpio
sudo pip install python-uinput
pip install evdev
sudo git clone https://github.com/Aboyd656/RetroPie-Switch/tree/master/JoyCons /home/pi/JoyController/
sudo cp /home/pi/PiSwitch/autostart.sh /opt/retropie/configs/all/autostart.sh
sudo cp -R /home/pi/PiSwitch/NewTouchBoot/ /opt/retropie/configs/all/NewTouchBoot
sudo cp /home/pi/PiSwitch/config.txt /boot/config.txt
sudo cp /home/pi/PiSwitch/SwitchBerry.jpg /home/pi/RetroPie/splashscreens/SwitchBerry.jpg
sudo cp /home/pi/PiSwitch/cmdline.txt /boot/cmdline.txt
sudo cp /home/pi/PiSwitch/splashscreen.list /etc/splashscreen.list
sudo chmod 777 /home/pi/RetroPie/splashscreens/SwitchBerry.jpg
sudo chmod 777 /etc/splashscreen.list
sudo chmod 777 /boot/cmdline.txt
sudo chmod a+x /boot/cmdline.txt
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/checknum
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/retro.jpg
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/kodi.jpg
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/terminal.png
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/Debian.jpg
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/left.jpg
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/right.jpg
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/check.png
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/logfile.txt
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/starter.sh
sudo chmod a+x /opt/retropie/configs/all/NewTouchBoot/starter.sh
sudo chmod 777 /opt/retropie/configs/all/NewTouchBoot/pywx.py
sudo chmod a+x /opt/retropie/configs/all/NewTouchBoot/pywx.py
sudo chmod 777 /opt/retropie/configs/all/autostart.sh
sudo chmod a+x /opt/retropie/configs/all/autostart.sh
sudo reboot
