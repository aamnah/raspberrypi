# Variables
REPO="https://raw.githubusercontent.com/aamnah/raspberrypi/master/"

# Bash Profile
##############

# copy the bash profile from Github and overwrite the existing one
curl ${REPO}.bashrc > ~/.bashrc

# load new bash profile
source ~/.bashrc
