# Raspberry Pi
Raspberry Pi related scripts and settings

Note: This repo is a draft, main purpose is to serve as a backup as I go along experimenting. I haven't spend much time _prettifying_ it i.e. (my usual level of comments and testing) as the priority was figuring out _what does this button do?_. 


### Run `init.sh`

    curl -s https://raw.githubusercontent.com/aamnah/raspberrypi/master/init.sh | bash

- Overwrites existing `.bashrc` with the one included in this repo
- Setup GPIO shortcuts
- Setup a pre-defined custom MOTD
- Setup bash aliases for scripts installed 
- Reload all changes

The prupose of this script is to serve as a one click solution for taking care of all the things I usually do after setting up a Pi. These include customizing the bash profile, setting up a login message with useful info, setting up GPIO shortcuts etc. 

The script has some logic built-in, it asks you if you want to install a script, and only installs it if you say yes. If you don't it'll skip that part and move on to the next thing in the script. This is handy when you have for example already configured your ~/.bashrc and do not want to override it.


### gpio.py
`gpio.py` is a python script that let's you turn any GPIO pin on or off with a Terminal command.

![GPIO screenshot](https://raw.githubusercontent.com/aamnah/raspberrypi/master/screenshots/gpio.png)

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

## motd.sh
Sets the Message of the day.

- Says hello in French
- Identifies the Raspberry Pi version.
- Shows internal and external IP addresses

![motd-screenshot](https://raw.githubusercontent.com/aamnah/raspberrypi/master/screenshots/motd.png)
