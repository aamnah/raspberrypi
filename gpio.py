#!/usr/bin/env python

# basic usage
# gpio 2 on  # equal to RPi.GPIO.output(2, RPi.GPIO.HIGH)
# gpio 2 off # equal to RPi.GPIO.output(2, RPi.GPIO.LOW)
# gpio clear # equal to RPi.GPIO.cleanup()

# import the python module that controls Pi GPIO pins
import RPi.GPIO as GPIO
import sys

# Variables
PIN = int(sys.argv[1])

# Cleanup # Reset GPIO settings
if sys.argv[2] == "reset" or sys.argv[2] == "clear":
  GPIO.cleanup()

# Set state based on the second argument passed
elif sys.argv[2] == "on" or sys.argv[2] == "true" or sys.argv[2] == "high" or sys.argv[2] == "1":
  STATE = 1
elif sys.argv[2] == "off" or sys.argv[2] == "false" or sys.argv[2] == "low" or sys.argv[2] == "0":
  STATE = 0

# set pin numbering mode
GPIO.setmode(GPIO.BCM)

# Ignore warnings
GPIO.setwarnings(False)

# GPIO pin numbers
# for Python 3: pins = list(range(11, 17))
pins = range(1,26)

# set all GPIO pins as output
for i in pins:
  GPIO.setup(i, GPIO.OUT)

# Set output HIGH or LOW based on args passed to the script
# print(GPIO.output(PIN, STATE))
GPIO.output(PIN, STATE)
