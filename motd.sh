# Message Of The Day

# IP Address
# IP=`ifconfig wlan0 | grep "inet addr" | cut -d ":" -f 2 | cut -d " " -f 1`
IP=`hostname -I`
EXT_IP=`wget -q -O - http://icanhazip.com/ | tail`
RASPI_MODEL=`dmesg | grep "Machine model:" | cut -d ":" -f 2`

welcome() {
  echo "Bonjour!"
}

# Identify Pi version
# http://elinux.org/RPi_HardwareHistory
version() {
  echo "This is a" ${RASPI_MODEL}
}

# Show internal and external IP address
ip() {
  echo ${IP}
  echo ${EXT_IP}
}

# Execute
welcome
version 
ip
