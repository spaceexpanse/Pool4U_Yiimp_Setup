#!/usr/bin/env bash

################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox #
# Updated by Pool4U for YiiMP use...                                           #
# This script is intended to be ran from the Yiimp Server Installer            #
################################################################################

if [ -f /etc/yiimpserver.conf ]; then
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
  sudo cp -r functions.sh /etc/
  sudo cp -r editconf.py /usr/bin
  sudo chmod +x /usr/bin/editconf.py

  source preflight.sh

  if ! locale -a | grep en_US.utf8 > /dev/null; then
  hide_output locale-gen en_US.UTF-8
  fi

  export LANGUAGE=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LC_TYPE=en_US.UTF-8

  export NCURSES_NO_UTF8_ACS=1

  echo -e " Installing needed packages for setup to continue...$COL_RESET"
  sudo apt-get -q -q update
  echo -e "$GREEN Installing MariaDB Repository...$COL_RESET"
  hide_output sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
  if [[ ("$DISTRO" == "16") ]]; then
    sudo add-apt-repository 'deb [arch=amd64,arm64,i386,ppc64el] http://mirror.one.com/mariadb/repo/10.4/ubuntu xenial main' >/dev/null 2>&1
  else
    sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.one.com/mariadb/repo/10.4/ubuntu bionic main' >/dev/null 2>&1
  fi
  echo -e "$GREEN Done...$COL_RESET"
  echo -e "$GREEN Setting NTP to Europe/Skopje...$COL_RESET"
  sudo timedatectl set-ntp yes
  sudo timedatectl set-timezone Europe/Skopje
  echo -e "$GREEN Done...$COL_RESET"
  sudo mkdir /home/yiimp-data
  sudo mkdir /home/yiimp-data/wallets
  sudo chown -R pool:pool /home/yiimp-data/
  sudo apt install software-properties-common -y
  sudo apt install python-certbot-nginx -y
  echo -e "$GREEN Installing needed repository...$COL_RESET"
  sudo add-apt-repository ppa:certbot/certbot -y
  sudo add-apt-repository ppa:bitcoin/bitcoin -y
  sudo add-apt-repository ppa:ondrej/php -y
  sudo add-apt-repository ppa:wireguard/wireguard -y
  echo -e "$GREEN Done...$COL_RESET"
  echo -e "$GREEN Installing needed packages...$COL_RESET"
  sudo apt install dialog git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 wget bc -y
  sudo apt install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libboost-all-dev -y
  sudo apt install libdb4.8-dev libdb4.8++-dev libcurl4-gnutls-dev mcrypt imagemagick libruby memcached fail2ban libdb5.1 libdb5.1++ -y
  sudo apt install libdb5.3 libdb5.3++ libdb5.3++-dev libminiupnpc-dev libzmq3-dev libgmp-dev libqrencode-dev libboost-program-options1.65.1 -y
  sudo apt install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler update-motd -y
  sudo apt install php7.3 php7.3-fpm php7.3-opcache php7.3-common php7.3-gd php7.3-mysql php7.3-imap php7.3-cli php7.3-cgi haveged ntp -y
  sudo apt install php-pear php-auth-sasl php7.3-curl php7.3-intl php7.3-pspell php7.3-recode php7.3-sqlite3 php7.3-tidy php7.3-xmlrpc -y
  sudo apt install php7.3-xsl php7.3-memcache php-memcache php-imagick php-gettext php7.3-zip php7.3-mbstring python3-dev python3-pip -y
  sudo apt install ntpdate curl git zip vim coreutils pollinate unattended-upgrades cron pwgen libgmp3-dev libmysqlclient-dev rsyslog -y
  sudo apt install libkrb5-dev libldap2-dev libidn11-dev librtmp-dev libpsl-dev libnghttp2-dev cmake gnupg2 acl update-notifier-common -y
  sudo apt install nginx ca-certificates certbot lsb-release libsodium-dev libssh2-1 libssh2-1-dev landscape-common ufw purge -y
  sudo apt install screen cifs-utils traceroute software-properties-common dist-upgrade wireguard wireguard-dkms wireguard-tools -y
  sudo apt install rar unzip libboost-program-options-dev qtbase5-dev bison libexpat1-dev libdbus-1-dev libfontconfig-dev libfreetype6-dev -y
  sudo apt install libice-dev libsm-dev libx11-dev libxau-dev libxext-dev libxcb1-dev libxkbcommon-dev xcb-proto x11proto-xext-dev -y
  sudo apt install x11proto-dev xtrans-dev zlib1g-dev libczmq-dev autoconf apt-transport-https figlet apache2 apache2-* -y
  echo -e "$GREEN Done...$COL_RESET"
  echo -e "$GREEN  Installing updates/upgades for packages...$COL_RESET"
  sudo apt update -y
  sudo apt upgrade -y
  echo -e "$GREEN Done...$COL_RESET"
  echo -e "$GREEN Please pick PHP7.3 as default...$COL_RESET"
  sudo update-alternatives --config php || exit 1
  echo -e "$GREEN Done...$COL_RESET"
  if [[ $EUID -ne 0 ]]; then
    message_box "Pool4U Yiimp Server Setup Installer v1.0" \
    "Hello and thanks for using the Pool4U Yiimp Setup Installer!
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

  if ! locale -a | grep en_US.utf8 > /dev/null; then
    hide_output locale-gen en_US.UTF-8
  fi
	export LANGUAGE=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LC_TYPE=en_US.UTF-8
	export NCURSES_NO_UTF8_ACS=1

	source /etc/functions.sh
	source /etc/yiimpserver.conf
	cd $HOME/yiimpserver/install
	source menu.sh
	echo
	echo "-----------------------------------------------"
	echo
	echo Thank you for using the Pool4U Yiimp Server Installer!
	echo
	echo To run this installer anytime simply type, yiimpserver!
	echo
	cd ~
fi
