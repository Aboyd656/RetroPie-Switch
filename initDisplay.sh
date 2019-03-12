#!/usr/bin/env bash

#HDMI connection?
rm -f hdmi.name
tvservice -n 2>hdmi.name
HDMI_NAME=`cat hdmi.name`
echo $HDMI_NAME
if [ "$HDMI_NAME" = "[E] No device present" ]; then
	LCD_ON=`cat /boot/config.txt | grep "ignore_lcd=1"`
	#echo "HDMI_ON"
	if [ "$LCD_ON" = "ignore_lcd=1" ]; then
			echo "reboot  LCD test"
			sudo rm -f /boot/config.txt
			sudo cp /boot/config_lcd.txt /boot/config.txt
			sudo cp /usr/share/alsa/alsa.conf.lcd /usr/share/alsa/alsa.conf
			sudo reboot -n
	fi
else
	HDMI_ON=`cat /boot/config.txt | grep "#lcd_rotate=0"`
	echo "LCD_ON"
	if  [ "$HDMI_ON" = "#lcd_rotate=0" ]; then
			echo "reboot HDMI"
			sudo rm -f /boot/config.txt
			sudo cp /boot/config_hdmi.txt /boot/config.txt
			sudo cp /usr/share/alsa/alsa.conf.hdmi /usr/share/alsa/alsa.conf
			sudo reboot -n
	fi
fi
