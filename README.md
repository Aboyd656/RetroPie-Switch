# RetroPie-Switch: THIS PROJECT IS NO LONGER SUPPORTED, JUST BUY A STEAM DECK

![RetroPie-Switch](https://i.imgur.com/a2dWYAJ.jpg)

![Imgur](https://i.imgur.com/8i81Jbe.jpg)

![Imgur](https://i.imgur.com/DPmfXfZ.jpg)

I have uploaded the step,igus, and sldprt files for the main case. I don't guarantee that the hole locations for the screen are perfect, I had to open up the holes a bit to match the hole pattern on my screen, I believe this is an issue with my printer though. The joycons will slide right in and fit snug. any pi case that mounts through the bottom of the case should work with the main case, the mounting holes are the same as the Pi. This is a work in progress, and feel free to modify. I have only tested the battery life to ~1:15min, but theoretically it should go further. I recommend a better lipo charger if you know of one, these cheap chinese ones are not great. This setup will power the pi up to 3A, using my charge doctor it pulls ~2.5A. Make sure your battery can support this, and have a charger than can support charging and the Pi together. It is a UPS, so you can plug and unplug the pi without it powering down. I don't have a shutdown button yet, the case has one I just haven't set it up, the latching microswitch is to turn off the 5v step up regulator off for a total shutdown to save the battery. Let me know if you have any suggestions for improvements or have any questions!

Both Joycons work as one, I do not have two player mode setup yet. Follow this tutorial to get you started, you will have to make modifications to the button layouts though. https://github.com/DP-INVENTIONS/RASPSWITCH


# MORE DETAILS ON CHARGING CIRCUIT: 
I finally have a battery solution that works, these things are such a pain in the ass to battery power. The biggest issue I ran into was over-current protection on most 5v equipment is 1 or 2 amps.

What you need:
- Pololu 5V Step-Up Voltage Regulator U3V70F5 to step the battery voltage up to 5.2v.
- An unprotected battery of your choice that is at least 2500mAh. I use a 5000mAh lipo that I removed the protection board from.  I guess there is something I don't understand about LiPo batteries. It says it's rated at 1C discharge, but the protection board cuts out at 2A. Shouldn't it be 5 in my case? IDK, it's easy enough to add external protections.
- TP4056 charging board for the lipo, you need to wire it up to bypass the internal over current protection though. So use the battery input pins as your output as well.
- Two schottky diodes that can handle the current. I used 1N5822 diodes.
- Some beefy wire.

Follow this circuit: http://www.electrobob.com/5up-simple-5v-ups/. The only things I would change are to wire in a push button for a shutdown of the step up regulator, and what I mentioned about the battery output on the charging board.

The step up regulator has a low voltage cut off of 2.5v, which is ok for this because it is after your diode drop of ~.4v, so the battery is still at a safe voltage. With a 5000mAh battery I can get ~1.25h of play time on my handheld. That's with a 7in screen and audio amplifier. I even use it to power my JoyCon charging grip sometimes!

# Parts list: 
- 7in official screen
- Pi 3b+
- Mechatronics Art 3b case (https://www.mechatronicsart.com/shop/raspberry-pi-3-aluminum-case/)
- 12in flex cable for screen (https://www.amazon.com/gp/product/B00I6LJ19G/ref=ppx_yo_dt_b_asin_title_o07_s00?ie=UTF8&psc=1)
- TP4056 charging board for the lipo (https://www.amazon.com/gp/product/B06XCXPY86/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
- 5000mAh Lipo battery
- Pololu 5V Step-Up Voltage Regulator U3V70F5 (https://www.pololu.com/product/2891)
- 2x 3A shottky diodes, if you don't have any, then just buy a big assortment pack (https://www.amazon.com/gp/product/B01MCY9BWY/ref=ppx_yo_dt_b_asin_title_o07_s00?ie=UTF8&psc=1)
- Micro USB breakout board (https://www.pololu.com/product/2586)
- Protoboard (this makes it easier to do a clean job with the internal wiring)
- Adafruit 2.5w amplifier (https://www.amazon.com/gp/product/B00PY2YSI4/ref=ppx_yo_dt_b_asin_title_o09_s03?ie=UTF8&psc=1)
- Mini metal speaker (https://www.amazon.com/gp/product/B00N4YSRRC/ref=ppx_yo_dt_b_asin_title_o09_s01?ie=UTF8&psc=1)
- 22gauge silicone wire. 
- 1x latching microswitch

# Programming: 

Start emulation station with a usb keyboard connected. Configure the input to these keys:

- D-PAD UP > arrow up
- D-PAD DOWN > arrow down
- D-PAD LEFT > arrow left
- D-PAD RIGHT > arrow right
- START > alt left
- SELECT > alt right
- A > a  
- B > b
- X > x
- Y > y
- LEFT SHOULDER > o
- RIGHT SHOULDER > u
- LEFT TRIGGER > p
- RIGHT TRIGGER > z
- LEFT THUMB > m 
- RIGHT THUMB > n
- LEFT ANALOG UP > g
- LEFT ANALOG DOWN > t
- LEFT ANALOG LEFT > f
- LEFT ANALOG RIGHT > h
- RIGHT ANALOG UP > 0
- RIGHT ANALOG DOWN > 1
- RIGHT ANALOG LEFT > 2
- RIGHT ANALOG RIGHT > 3
- HOTKEY ENABLE > escape key

After you have configured the keyboard, navigate to the bluetooth setup in RetroPie Setup

- Grab the left Joycon and select Register Bluetooth Device using the keyboard.
  - Press the pairing button on the inside of the joycon and wait for the Pi to pick it up. **MAKE NOTE OF THE MAC ADDRESS FOR THE CONTROLLER!**
  - Select No input/ No Output 
- Repeat this for the right Joycon

# INSTALLATION OPTIONS

SSH into your raspberry pi. There are setup files for either individual installations, ie just Joy Con or just Display Switching, and a file for installing all three together. 

Joy Con control, Display Switching, and Touch boot screen

sudo wget https://github.com/Aboyd656/RetroPie-Switch/blob/master/setup_all.sh
      

