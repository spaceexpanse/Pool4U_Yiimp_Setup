#!/usr/bin/env bash

################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox #
# Updated by Pool4U for YiiMP use...                                           #
# This script is intended to be ran from the Yiimp Server Installer            #
################################################################################

# Clone the MultiPool repository if it doesn't exist.
if [ ! -d $HOME/yiimpserver/yiimp_multi ]; then
	echo Downloading Pool4U Yiimp Multi Server Installer V1.0. . .
	git clone \
		https://github.com/Pool4U/Server_Yiimp_Multi \
		$HOME/yiimpserver/yiimp_multi \
		< /dev/null 2> /dev/null

	echo
fi

# Start setup script.
cd $HOME/yiimpserver/yiimp_multi
source start.sh
