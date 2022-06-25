#!/usr/bin/env bash

################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox #
# Updated by Pool4U for YiiMP use...                                           #
# This script is intended to be ran from the Yiimp Server Installer            #
################################################################################

# Clone the Yiimp repository if it doesn't exist.
if [ ! -d $HOME/yiimpserver/yiimp_single ]; then
	echo Downloading Yiimp Single Server Installer v1.0. . .
	git clone -b spex https://github.com/spaceexpanse/Yiimp_Single_Installer "$HOME"/yiimpserver/yiimp_single < /dev/null 2> /dev/null
	echo
fi

# Start setup script.
cd $HOME/yiimpserver/yiimp_single
source start.sh
