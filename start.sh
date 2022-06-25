#!/usr/bin/env bash

################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox #
# Updated by Pool4U for YiiMP use...                                           #
# This script is intended to be ran from the Yiimp Server Installer            #
################################################################################

# Recall the last settings used if we're running this a second time.
if [ -f /etc/yiimpserver.conf ]; then
# Load the old .conf file to get existing configuration options loaded
# into variables with a DEFAULT_ prefix.
cat /etc/yiimpserver.conf | sed s/^/DEFAULT_/ > /tmp/yiimpserver.prev.conf
source /tmp/yiimpserver.prev.conf
rm -f /tmp/yiimpserver.prev.conf
else
FIRST_TIME_SETUP=1
fi

if [[ ("$FIRST_TIME_SETUP" == "1") ]]; then
  clear
  cd $HOME/yiimpserver/install

  source functions.sh
  # copy functions to /etc
  sudo cp -r functions.sh /etc/
  sudo cp -r editconf.py /usr/bin
  sudo chmod +x /usr/bin/editconf.py

  # Check system setup: Are we running as root on Ubuntu 16.04 or 18.04
  # on a machine with enough memory?
  # If not, this shows an error and exits.
  source preflight.sh

  # Ensure Python reads/writes files in UTF-8. If the machine
  # triggers some other locale in Python, like ASCII encoding,
  # Python may not be able to read/write files. This is also
  # in the management daemon startup script and the cron script.

  if ! locale -a | grep en_US.utf8 > /dev/null; then
  # Generate locale if not exists
  hide_output locale-gen en_US.UTF-8
  fi

  export LANGUAGE=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LC_TYPE=en_US.UTF-8

  # Fix so line drawing characters are shown correctly in Putty on Windows. See #744.
  export NCURSES_NO_UTF8_ACS=1

  #check for user
  echo -e " Installing needed packages for setup to continue...$COL_RESET"
  sudo apt-get -q -q update
  apt_get_quiet install dialog python3 python3-pip acl nano rar apt-transport-https || exit 1

  # Are we running as root?
  if [[ $EUID -ne 0 ]]; then
    # Welcome
    message_box "Yiimp Server Setup Installer v1.0" \
    "Hello and thanks for using the Yiimp Setup Installer!
    \n\nInstallation for the most part is fully automated. In most cases any user responses that are needed are asked prior to the installation.
    \n\nNOTE: You should only install this on a brand new Ubuntu 16.04 or Ubuntu 18.04 installation."
  	source existing_user.sh
    exit
    else
    source create_user.sh
  	exit
  fi
	cd ~

else

clear

# Ensure Python reads/writes files in UTF-8. If the machine
# triggers some other locale in Python, like ASCII encoding,
# Python may not be able to read/write files. This is also
# in the management daemon startup script and the cron script.
	if ! locale -a | grep en_US.utf8 > /dev/null; then
	   # Generate locale if not exists
	    hide_output locale-gen en_US.UTF-8
	fi
	export LANGUAGE=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_TYPE=en_US.UTF-8
	# Fix so line drawing characters are shown correctly in Putty on Windows. See #744.
	export NCURSES_NO_UTF8_ACS=1

  # Load our functions and variables.
	source /etc/functions.sh
	source /etc/yiimpserver.conf
  # Start yiimpserver
	cd $HOME/yiimpserver/install
	source menu.sh
	echo
	echo "-----------------------------------------------"
	echo
	echo Thank you for using the Yiimp Server Installer!
	echo
	echo To run this installer anytime simply type, yiimpserver!
	echo
	cd ~
fi
