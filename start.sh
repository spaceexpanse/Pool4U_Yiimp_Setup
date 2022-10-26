#!/usr/bin/env bash

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"

echo -e "$CYAN Installing needed packages for setup to continue...$COL_RESET"
    source install_packages.sh
echo -e "$GREEN Done...$COL_RESET"

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
    #clear
    cd $HOME/yiimpserver/install
    source functions.sh

    # copy functions to /etc
    sudo cp -r functions.sh /etc/
    sudo cp -r editconf.py /usr/bin
    sudo chmod +x /usr/bin/editconf.py

    source preflight.sh

    if ! locale -a | grep en_US.utf8 > /dev/null; then
        # Generate locale if not exists
        hide_output locale-gen en_US.UTF-8
    fi

    export LANGUAGE=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_TYPE=en_US.UTF-8
    export NCURSES_NO_UTF8_ACS=1

    #check for user
    
    echo -e "$CYAN Setting NTP to Europe/Skopje...$COL_RESET"
    hide_output sudo timedatectl set-ntp yes
    hide_output sudo timedatectl set-timezone Europe/Skopje
    echo -e "$GREEN Done...$COL_RESET"
        
    # Are we running as root?
    if [[ $EUID -ne 0 ]]; then
        # Welcome
        message_box "Pool4U Yiimp Server Setup Installer v1.0" \
        "Hello and thanks for using the Pool4U Yiimp Setup Installer!
        \n\nInstallation for the most part is fully automated. In most cases any user responses that are needed are asked prior to the installation.
        \n\nNOTE: You should only install this on a brand new Ubuntu 18.04 LTS installation."
        clear
        source existing_user.sh
        exit
    else
        clear
        source create_user.sh
        exit
    fi
	cd ~

else
        # Load our functions and variables.
        source /etc/functions.sh
        source /etc/yiimpserver.conf
        # Start yiimpserver
        cd $HOME/yiimpserver/install
        RESULT=1

        echo -e "$CYAN Downloading Pool4U Yiimp Single Server Installer v1.0...$COL_RESET"
	    git clone https://github.com/mivanoski/Pool4U_Yiimp_Single_Installer "$HOME"/yiimpserver/yiimp_single < /dev/null 2> /dev/null
        echo -e "$GREEN Done...$COL_RESET"

        cd $HOME/yiimpserver/yiimp_single
        source start.sh

        echo
        echo "-----------------------------------------------"
        echo
        echo Thank you for using the Pool4U Yiimp Server Installer!
        echo
        echo To run this installer anytime simply type, yiimpserver!
        echo
        cd ~
fi
