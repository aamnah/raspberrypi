# Raspberry Pi
Raspberry Pi related scripts and settings


### Run `init.sh`

    curl -s https://raw.githubusercontent.com/aamnah/raspberrypi/master/init.sh | bash

- Overwrites existing `.bashrc` with the one included in this repo


### gpio.py
`gpio.py` is a python script that let's you turn any GPIO pin on or off with a Terminal command.

![Screenshot 2016-03-04 00.58.48.png](quiver-image-url/60F7542ADC587D7FEB228861EA66AA31.png)

The general format is:
  
    gpio <pinNumber> <pinState>

So to turn the GPIO2 on, you would do:

    gpio 2 on

Similarly, to turn it off:

    gpio 2 off

**pinNumber** must be an integer between 1-26. By default, it uses the BCM pin numbering mode. BCM is the pin numbering as per the Braodcom SOC on your Raspberry Pi. You can turn any pin (there are 26 GPIO pins on the Raspberry Pi Model B+ and Model 2B) on/off.

**pinState** If you want to turn the state on/high, you can use any out of `on`, `true`, `high` or `1` keyword. and `off`,  `false`, `low`, `0` for turning it off.

    gpio 2 on
is the same as

    gpio 2 true
