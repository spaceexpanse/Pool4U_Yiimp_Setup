#!/usr/bin/env bash

################################################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox #
# Updated by Pool4U for YiiMP use...                                           #
# This script is intended to be ran from the Yiimp Server Installer            #
################################################################################

source settings.conf



    echo $default_username default_username
    echo $wireguard_ip wireguard_ip
    echo $wireguard_port wireguard_port
    echo $sql_ip sql_ip
    echo $sql_name sql_name
    echo $sql_root_user sql_root_user
    echo $sql_root_user_pass sql_root_user_pass
    echo $sql_www_user sql_www_user
    echo $sql_www_user_pass sql_www_user_pass
    echo $sql_stratum_user sql_stratum_user
    echo $sql_stratum_user_pass sql_stratum_user_pass
    echo $dns_url dns_url
    echo $dns_stratum dns_stratum
    echo $admin_email admin_email
    echo $btc_address btc_address
    echo $instal_folder instal_folder
    nano settings.conf
    exit



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

    if [ -f os.txt ]; then
        rm os.txt
    fi

    cat /etc/os-release >> os.txt
    clear

    source os.txt

    if [ "$VERSION_ID" != "18.04" ]; then
        clear
        echo -e "$YELLOW Sorry! This package can only be installed on version Ubuntu 18.04 LTS...$COL_RESET"
        echo -e "$BLUE Sorry! This package can only be installed on version Ubuntu 18.04 LTS...$COL_RESET"
        echo -e "$RED Sorry! This package can only be installed on version Ubuntu 18.04 LTS...$COL_RESET"
        exit
    fi

    source settings.conf



    echo $default_username default_username
    echo $wireguard_ip wireguard_ip
    echo $wireguard_port wireguard_port
    echo $sql_ip sql_ip
    echo $sql_name sql_name
    echo $sql_root_user sql_root_user
    echo $sql_root_user_pass sql_root_user_pass
    echo $sql_www_user sql_www_user
    echo $sql_www_user_pass sql_www_user_pass
    echo $sql_stratum_user sql_stratum_user
    echo $sql_stratum_user_pass sql_stratum_user_pass
    echo $dns_url dns_url
    echo $dns_stratum dns_stratum
    echo $admin_email admin_email
    echo $btc_address btc_address
    echo $instal_folder instal_folder
    nano settings.conf
    exit

    echo -e "$MAGENTA Creating recuired folders...$COL_RESET"
    sudo mkdir $instal_folder
    sudo mkdir $instal_folder/wallets
    sudo chown -R pool:pool $instal_folder/
    echo -e "$GREEN Done...$COL_RESET"
    
    echo -e "$MAGENTA Setting NTP to Europe/Skopje...$COL_RESET"
    sudo apt install \
        ntp \
        ntpdate \
        -y
    sudo timedatectl set-ntp yes
    sudo timedatectl set-timezone Europe/Skopje
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Start installation of all required packages...$COL_RESET"

    echo -e "$MAGENTA Installing MariaDB Repository...$COL_RESET"
    hide_output sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.one.com/mariadb/repo/10.4/ubuntu bionic main' >/dev/null 2>&1
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Install software-properties-common...$COL_RESET"
    sudo apt install software-properties-common -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Install certbot...$COL_RESET"
    sudo add-apt-repository ppa:certbot/certbot -y
    sudo apt install \
        python-certbot-nginx \
        ca-certificates \
        certbot \
        -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing ppa:bitcoin/bitcoin...$COL_RESET"
    sudo add-apt-repository ppa:bitcoin/bitcoin -y
    echo -e "$GREEN Done...$COL_RESET"
  
    echo -e "$MAGENTA Installing ppa:ondrej/php...$COL_RESET"
    sudo add-apt-repository ppa:ondrej/php -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing ppa:wireguard/wireguard...$COL_RESET"
    sudo add-apt-repository ppa:wireguard/wireguard -y
    sudo apt install \
        wireguard \
        wireguard-dkms \
        wireguard-tools \
        -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing lib*...$COL_RESET"
    sudo apt install \
        libtool \
        libssl-dev \
        libevent-dev \
        libboost-system-dev \
        libboost-filesystem-dev \
        libboost-chrono-dev \
        libboost-test-dev \
        libboost-thread-dev \
        libboost-all-dev \
        libdb4.8-dev \
        libdb4.8++-dev \
        libcurl4-gnutls-dev \
        libruby \
        libdb5.1 \
        libdb5.1++ \
        libdb5.3 \
        libdb5.3++ \
        libdb5.3++-dev \
        libminiupnpc-dev \
        libzmq3-dev \
        libgmp-dev \
        libqrencode-dev \
        libboost-program-options1.65.1 \
        libqt5gui5 \
        libqt5core5a \
        libqt5dbus5 \
        libprotobuf-dev \
        libgmp3-dev \
        libmysqlclient-dev \
        libkrb5-dev \
        libldap2-dev \
        libidn11-dev \
        librtmp-dev \
        libpsl-dev \
        libnghttp2-dev \
        libsodium-dev \
        libssh2-1 \
        libssh2-1-dev \
        libboost-program-options-dev \
        libexpat1-dev \
        libdbus-1-dev \
        libfontconfig-dev \
        libfreetype6-dev \
        libice-dev \
        libsm-dev \
        libx11-dev \
        libxau-dev \
        libxext-dev \
        libxcb1-dev \
        libxkbcommon-dev \
        libczmq-dev \
        -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing php*...$COL_RESET"
    sudo apt install \
        php7.3 \
        php7.3-fpm \
        php7.3-opcache \
        php7.3-common \
        php7.3-gd \
        php7.3-mysql \
        php7.3-imap \
        php7.3-cli \
        php7.3-cgi \
        php7.3-curl \
        php7.3-intl \
        php7.3-pspell \
        php7.3-recode \
        php7.3-sqlite3 \
        php7.3-tidy \
        php7.3-xmlrpc \
        php7.3-xsl \
        php7.3-zip \
        php7.3-mbstring \
        php7.3-memcache \
        php-pear \
        php-auth-sasl \
        php-memcache \
        php-imagick \
        php-gettext \
        -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA Installing other packages*...$COL_RESET"
    sudo apt install \
        dialog \
        build-essential \
        autotools-dev \
        automake \
        pkg-config \
        bsdmainutils \
        python3 \
        wget \
        bc \
        mcrypt \
        imagemagick \
        memcached \
        curl \
        zip \
        unzip \
        rar \
        vim \
        ufw \
        fail2ban \
        qttools5-dev \
        qttools5-dev-tools \
        qtbase5-dev \
        protobuf-compiler \
        update-motd \
        haveged \
        python3-dev \
        python3-pip \
        coreutils \
        pollinate \
        unattended-upgrades \
        cron \
        pwgen \
        rsyslog \
        cmake \
        gnupg2 \
        acl \
        update-notifier-common \
        nginx \
        lsb-release \
        landscape-common \
        purge \
        screen \
        cifs-utils \
        traceroute \
        software-properties-common \
        dist-upgrade \
        bison \
        xcb-proto \
        x11proto-xext-dev \
        x11proto-dev \
        xtrans-dev \
        zlib1g-dev \
        autoconf \
        apt-transport-https \
        figlet \
        -y
    echo -e "$GREEN Done...$COL_RESET"

    echo -e "$MAGENTA  Installing updates/upgades for packages...$COL_RESET"
    sudo apt update -y
    sudo apt upgrade -y
    echo -e "$GREEN Done...$COL_RESET"

    if [[ $EUID -ne 0 ]]; then
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
