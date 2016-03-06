# Variables

# Repo that contains all relevant scripts
REPO="https://raw.githubusercontent.com/aamnah/raspberrypi/master/"

# Location to save scripts to
SCRIPTS_PATH="/usr/local/bin/"

# Temporary Directory
TMP="/var/tmp/"

# Bash Profile
##############
# copy the bash profile from Github and overwrite the existing one

bashrc() {
  curl -s ${REPO}.bashrc > ~/.bashrc
}

# HOSTNAME
##########
hostname() {
  # Your current hostname is:
  # hostname
  # Would you like to update it? (y/n)
  # if y
  # take NEW_HOSTNAME
  # hostname NEW_HOSTNAME
}

# MOTD
######
motd() {
  read -p "Set up MOTD? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    # download and save motd file
    wget ${REPO}motd.sh -O /etc/profile.d/motd.sh
    # owner
    sudo chown root:root /etc/profile.d/motd.sh
    # permissions
    sudo chmod +x /etc/profile.d/motd.sh
    # delete default motd
    sudo rm /etc/motd
    
  elif [[ ! $REPLY =~ ^[Yy]$ ]] 
  then
    return 1
  fi
}

# GPIO
#######
gpio() {
  read -p "Set up GPIO shortcuts? (y/n) " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    wget ${REPO}gpio.py -O ${SCRIPTS_PATH}gpio.py
    chmod +x ${SCRIPTS_PATH}gpio.py
    echo "
    # GPIO 
    alias gpio='gpio.py'
    " >> ~/.bashrc
  elif [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    return 1
  fi
}

# Imgact
########
imgcat() {
  read -p "Set up imgcat for previewing images in Terminal? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    wget https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat -O ${SCRIPTS_PATH}imgcat.sh
    chmod +x ${SCRIPTS_PATH}imgcat.sh
    echo "
    # imgcat
    alias imgcat='imgcat.sh'
    " >> ~/.bashrc
  elif [[ ! $REPLY =~ ^[Yy]$ ]] 
  then
    return 1
  fi
}

# Reload settings / files
#########################
reload() {
  source ~/.bashrc
  service ssh restart
  # Empty Temp dir?
}


# apache



bashrc
hostname
motd
gpio
imgcat
reload

echo "All done. Enjoy!"
