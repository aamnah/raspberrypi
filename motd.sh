# Message Of The Day

# IP Address
# IP=`ifconfig wlan0 | grep "inet addr" | cut -d ":" -f 2 | cut -d " " -f 1`
IP=`hostname -I`
EXT_IP=`wget -q -O - http://icanhazip.com/ | tail`
REVISION=`cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^1000//'`

welcome() {
  echo "Bonjour!"
}

# Identify Pi version
# http://elinux.org/RPi_HardwareHistory
version() {
  if [ $REVISION == "000e" ]
    then
      echo "This a Raspberry Pi Model B - 512MB RAM. "
  elif [ $REVISION == "0010" ]
    then
      echo "This is a Raspberry Pi Model B+ - 512MB RAM. "
  elif [ $REVISION == "a21041" ]
    then
      echo "This is a Raspberry Pi 2 Model B - 1GB RAM. "
  fi
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
