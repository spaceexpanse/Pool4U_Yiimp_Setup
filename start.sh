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
    echo -e "$MAGENTA Installing needed packages for setup to continue...$COL_RESET"

    #echo -e "$MAGENTA Creating recuired folders...$COL_RESET"
    #sudo mkdir /home/yiimp-data
    #sudo mkdir /home/yiimp-data/wallets
    #sudo chown -R pool:pool /home/yiimp-data/
    #echo -e "$GREEN Done...$COL_RESET"
    
    echo -e "$MAGENTA Setting NTP to Europe/Skopje...$COL_RESET"
    sudo apt-get install ntp -y
    sudo apt-get install ntpdate -y
    sudo timedatectl set-ntp yes
    sudo timedatectl set-timezone Europe/Skopje
    echo -e "$GREEN Done...$COL_RESET"
    
    #check for user
    echo -e " Installing needed packages for setup to continue...$COL_RESET"
    #sudo apt-get -q -q update
  
    #apt_get_quiet install dialog python3 python3-pip acl nano rar apt-transport-https || exit 1

    echo -e "$MAGENTA Start installation of all required packages...$COL_RESET"

    echo -e "$MAGENTA Installing MariaDB Repository...$COL_RESET"
    hide_output sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.one.com/mariadb/repo/10.4/ubuntu bionic main' >/dev/null 2>&1
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Install software-properties-common...$COL_RESET"
    sudo apt-get install software-properties-common -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Install certbot...$COL_RESET"
    sudo add-apt-repository ppa:certbot/certbot -y
    sudo apt-get install python-certbot-nginx -y
    sudo apt-get install ca-certificates -y
    sudo apt-get install certbot -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing ppa:bitcoin/bitcoin...$COL_RESET"
    sudo add-apt-repository ppa:bitcoin/bitcoin -y
    echo -e "$GREEN Done...$COL_RESET"
  
    echo -e "$MAGENTA Installing ppa:ondrej/php...$COL_RESET"
    sudo add-apt-repository ppa:ondrej/php -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing ppa:wireguard/wireguard...$COL_RESET"
    sudo add-apt-repository ppa:wireguard/wireguard -y
    sudo apt install wireguard -y
    sudo apt install wireguard-dkms -y
    sudo apt install wireguard-tools -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing lib*...$COL_RESET"
    sudo apt-get install libtool -y
    sudo apt-get install libssl-dev -y
    sudo apt-get install libevent-dev -y
    sudo apt-get install libboost-system-dev -y
    sudo apt-get install libboost-filesystem-dev -y
    sudo apt-get install libboost-chrono-dev -y
    sudo apt-get install libboost-test-dev -y
    sudo apt-get install libboost-thread-dev -y
    sudo apt-get install libboost-all-dev -y
    sudo apt-get install libdb4.8-dev -y
    sudo apt-get install libdb4.8++-dev -y
    sudo apt-get install libcurl4-gnutls-dev -y
    sudo apt-get install libruby -y
    sudo apt-get install libdb5.1 -y
    sudo apt-get install libdb5.1++ -y
    sudo apt-get install libdb5.3 -y
    sudo apt-get install libdb5.3++ -y
    sudo apt-get install libdb5.3++-dev -y
    sudo apt-get install libminiupnpc-dev -y
    sudo apt-get install libzmq3-dev -y
    sudo apt-get install libgmp-dev -y
    sudo apt-get install libqrencode-dev -y
    sudo apt-get install libboost-program-options1.65.1 -y
    sudo apt-get install libqt5gui5 -y
    sudo apt-get install libqt5core5a -y
    sudo apt-get install libqt5dbus5 -y
    sudo apt-get install libprotobuf-dev -y
    sudo apt-get install libgmp3-dev -y
    sudo apt-get install libmysqlclient-dev -y
    sudo apt-get install libkrb5-dev -y
    sudo apt-get install libldap2-dev -y
    sudo apt-get install libidn11-dev -y
    sudo apt-get install librtmp-dev -y
    sudo apt-get install libpsl-dev -y
    sudo apt-get install libnghttp2-dev -y
    sudo apt-get install libsodium-dev -y
    sudo apt-get install libssh2-1 -y
    sudo apt-get install libssh2-1-dev -y
    sudo apt-get install libboost-program-options-dev -y
    sudo apt-get install libexpat1-dev -y
    sudo apt-get install libdbus-1-dev -y
    sudo apt-get install libfontconfig-dev -y
    sudo apt-get install libfreetype6-dev -y
    sudo apt-get install libice-dev -y
    sudo apt-get install libsm-dev -y
    sudo apt-get install libx11-dev -y
    sudo apt-get install libxau-dev -y
    sudo apt-get install libxext-dev -y
    sudo apt-get install libxcb1-dev -y
    sudo apt-get install libxkbcommon-dev -y
    sudo apt-get install libczmq-dev -y
    sudo apt-get install libiniparser-dev -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing php*...$COL_RESET"
    sudo apt-get install php7.3 -y
    sudo apt-get install php7.3-fpm -y
    sudo apt-get install php7.3-opcache -y
    sudo apt-get install php7.3-common -y
    sudo apt-get install php7.3-gd -y
    sudo apt-get install php7.3-mysql -y
    sudo apt-get install php7.3-imap -y
    sudo apt-get install php7.3-cli -y
    sudo apt-get install php7.3-cgi -y
    sudo apt-get install php7.3-curl -y
    sudo apt-get install php7.3-intl -y
    sudo apt-get install php7.3-pspell -y
    sudo apt-get install php7.3-recode -y
    sudo apt-get install php7.3-sqlite3 -y
    sudo apt-get install php7.3-tidy -y
    sudo apt-get install php7.3-xmlrpc -y
    sudo apt-get install php7.3-xsl -y
    sudo apt-get install php7.3-zip -y
    sudo apt-get install php7.3-mbstring -y
    sudo apt-get install php7.3-memcache -y
    sudo apt-get install php-pear -y
    sudo apt-get install php-auth-sasl -y
    sudo apt-get install php-memcache -y
    sudo apt-get install php-imagick -y
    sudo apt-get install php-gettext -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing other packages*...$COL_RESET"
    sudo apt install build-essential -y
    sudo apt install autotools-dev -y
    sudo apt install automake -y
    sudo apt install pkg-config -y
    sudo apt install bsdmainutils -y
    sudo apt install python3 -y
    sudo apt install wget -y
    sudo apt install bc -y
    sudo apt install mcrypt -y
    sudo apt install imagemagick -y
    sudo apt install memcached -y
    sudo apt install curl -y
    sudo apt install zip -y
    sudo apt install unzip -y
    sudo apt install rar -y
    sudo apt install vim -y
    sudo apt install fail2ban -y
    sudo apt install ufw -y
    sudo apt install qttools5-dev -y
    sudo apt install qttools5-dev-tools -y
    sudo apt install qtbase5-dev -y
    sudo apt install protobuf-compiler -y
    sudo apt install update-motd -y
    sudo apt install haveged -y
    sudo apt install python3-dev -y
    sudo apt install python3-pip -y
    sudo apt install coreutils -y
    sudo apt install pollinate -y
    sudo apt install unattended-upgrades -y
    sudo apt install cron -y
    sudo apt install pwgen -y
    sudo apt install rsyslog -y
    sudo apt install cmake -y
    sudo apt install gnupg2 -y
    sudo apt install acl -y
    sudo apt install update-notifier-common -y
    sudo apt install nginx -y
    sudo apt install lsb-release -y
    sudo apt install landscape-common -y
    sudo apt install screen -y
    sudo apt install cifs-utils -y
    sudo apt install traceroute -y
    sudo apt install software-properties-common -y
    sudo apt install bison -y
    sudo apt install xcb-proto -y
    sudo apt install x11proto-xext-dev -y
    sudo apt install x11proto-dev -y
    sudo apt install xtrans-dev -y
    sudo apt install zlib1g-dev -y
    sudo apt install autoconf -y
    sudo apt install dh-autoreconf -y
    sudo apt install apt-transport-https -y
    sudo apt install figlet -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA  Installing updates/upgades for packages...$COL_RESET"
    sudo apt update -y
    sudo apt upgrade -y
    echo -e "$GREEN Done...$COL_RESET"

    # Are we running as root?
    if [[ $EUID -ne 0 ]]; then
        # Welcome
        message_box "Pool4U Yiimp Server Setup Installer v1.0" \
        "Hello and thanks for using the Pool4U Yiimp Setup Installer!
        \n\nInstallation for the most part is fully automated. In most cases any user responses that are needed are asked prior to the installation.
        \n\nNOTE: You should only install this on a brand new Ubuntu 18.04 LTS installation."
        source existing_user.sh
        exit
    else
        source create_user.sh
        exit
    fi
	cd ~

else

    #clear

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
        #source menu.sh
        RESULT=1
        source bootstrap_single.sh
        echo
        echo "-----------------------------------------------"
        echo
        echo Thank you for using the Pool4U Yiimp Server Installer!
        echo
        echo To run this installer anytime simply type, yiimpserver!
        echo
        cd ~
fi
