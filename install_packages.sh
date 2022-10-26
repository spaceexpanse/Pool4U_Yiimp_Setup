ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"

echo -e "$CYAN Removing Apache and installing NGINX...$COL_RESET"
    sudo apt-get purge apache2 -y -q
    sudo apt-get purge apache2-* -y -q
    sudo apt-get --purge autoremove -y -q
    sudo apt-get install nginx -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Installing MariaDB Repository...$COL_RESET"
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.one.com/mariadb/repo/10.4/ubuntu bionic main' >/dev/null 2>&1
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Install software-properties-common...$COL_RESET"
    sudo apt-get install software-properties-common -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Install certbot...$COL_RESET"
    sudo add-apt-repository ppa:certbot/certbot -y -q
    sudo apt-get install python-certbot-nginx -y -q
    sudo apt-get install ca-certificates -y -q
    sudo apt-get install certbot -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Installing ppa:bitcoin/bitcoin...$COL_RESET"
    sudo add-apt-repository ppa:bitcoin/bitcoin -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Installing ppa:ondrej/php...$COL_RESET"
    sudo add-apt-repository ppa:ondrej/php -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Installing ppa:wireguard/wireguard...$COL_RESET"
    sudo apt-get install wireguard -y -q
    sudo apt-get install wireguard-dkms -y -q
    #sudo apt-get install wireguard-tools -y -q
    #sudo add-apt-repository ppa:wireguard/wireguard -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Installing packages*...$COL_RESET"
    sudo apt-get install git -y -q
    sudo apt-get install nano -y -q
    sudo apt-get install dialog -y -q
    sudo apt-get install build-essential -y -q
    sudo apt-get install autotools-dev -y -q
    sudo apt-get install automake -y -q
    sudo apt-get install pkg-config -y -q
    sudo apt-get install bsdmainutils -y -q
    sudo apt-get install python3 -y -q
    sudo apt-get install python3-dev -y -q
    sudo apt-get install python3-pip -y -q
    #sudo apt-get install wget -y -q
    #sudo apt-get install bc -y -q
    sudo apt-get install mcrypt -y -q
    sudo apt-get install imagemagick -y -q
    sudo apt-get install memcached -y -q
    sudo apt-get install curl -y -q
    sudo apt-get install zip -y -q
    sudo apt-get install unzip -y -q
    sudo apt-get install rar -y -q
    #sudo apt-get install vim -y -q
    sudo apt-get install fail2ban -y -q
    sudo apt-get install ufw -y -q
    sudo apt-get install qttools5-dev -y -q
    sudo apt-get install qttools5-dev-tools -y -q
    #sudo apt-get install qtbase5-dev -y -q
    sudo apt-get install protobuf-compiler -y -q
    sudo apt-get install update-motd -y -q
    sudo apt-get install haveged -y -q
    #sudo apt-get install coreutils -y -q
    #sudo apt-get install pollinate -y -q
    #sudo apt-get install unattended-upgrades -y -q
    #sudo apt-get install cron -y -q
    sudo apt-get install pwgen -y -q
    #sudo apt-get install rsyslog -y -q
    sudo apt-get install cmake -y -q
    sudo apt-get install gnupg2 -y -q
    #sudo apt-get install acl -y -q
    #sudo apt-get install update-notifier-common -y -q
    #sudo apt-get install lsb-release -y -q
    #sudo apt-get install landscape-common -y -q
    #sudo apt-get install screen -y -q
    sudo apt-get install cifs-utils -y -q
    sudo apt-get install traceroute -y -q
    sudo apt-get install bison -y -q
    sudo apt-get install xcb-proto -y -q
    #sudo apt-get install x11proto-xext-dev -y -q
    #sudo apt-get install x11proto-dev -y -q
    #sudo apt-get install xtrans-dev -y -q
    sudo apt-get install zlib1g-dev -y -q
    #sudo apt-get install autoconf -y -q
    sudo apt-get install dh-autoreconf -y -q
    sudo apt-get install apt-transport-https -y -q
    sudo apt-get install gnutls-dev -y -q
    sudo apt-get install figlet -y -q
    sudo apt-get install sendmail -y -q
    sudo apt-get install ntp -y -q
    sudo apt-get install ntpdate -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Installing lib*...$COL_RESET"
    sudo apt-get install libdb4.8-dev -y -q
    sudo apt-get install libdb4.8++-dev -y -q
    sudo apt-get install libdb5.1 -y -q
    sudo apt-get install libdb5.1++ -y -q
    sudo apt-get install libdb5.3 -y -q
    sudo apt-get install libdb5.3++ -y -q
    sudo apt-get install libdb5.3++-dev -y -q
    sudo apt-get install libtool -y -q
    sudo apt-get install libssl-dev -y -q
    sudo apt-get install libevent-dev -y -q
    sudo apt-get install libboost-system-dev -y -q
    sudo apt-get install libboost-filesystem-dev -y -q
    sudo apt-get install libboost-chrono-dev -y -q
    sudo apt-get install libboost-test-dev -y -q
    sudo apt-get install libboost-thread-dev -y -q
    sudo apt-get install libboost-all-dev -y -q
    sudo apt-get install libcurl4-gnutls-dev -y -q
    sudo apt-get install libruby -y -q
    sudo apt-get install libminiupnpc-dev -y -q
    sudo apt-get install libzmq3-dev -y -q
    sudo apt-get install libgmp-dev -y -q
    sudo apt-get install libqrencode-dev -y -q
    sudo apt-get install libboost-program-options1.65.1 -y -q
    sudo apt-get install libqt5gui5 -y -q
    sudo apt-get install libqt5core5a -y -q
    sudo apt-get install libqt5dbus5 -y -q
    sudo apt-get install libprotobuf-dev -y -q
    sudo apt-get install libgmp3-dev -y -q
    sudo apt-get install libmysqlclient-dev -y -q
    sudo apt-get install libkrb5-dev -y -q
    sudo apt-get install libldap2-dev -y -q
    sudo apt-get install libidn11-dev -y -q
    sudo apt-get install librtmp-dev -y -q
    sudo apt-get install libpsl-dev -y -q
    sudo apt-get install libnghttp2-dev -y -q
    sudo apt-get install libsodium-dev -y -q
    sudo apt-get install libssh2-1 -y -q
    sudo apt-get install libssh2-1-dev -y -q
    sudo apt-get install libboost-program-options-dev -y -q
    sudo apt-get install libexpat1-dev -y -q
    sudo apt-get install libdbus-1-dev -y -q
    sudo apt-get install libfontconfig-dev -y -q
    sudo apt-get install libfreetype6-dev -y -q
    sudo apt-get install libice-dev -y -q
    sudo apt-get install libsm-dev -y -q
    sudo apt-get install libx11-dev -y -q
    sudo apt-get install libxau-dev -y -q
    sudo apt-get install libxext-dev -y -q
    sudo apt-get install libxcb1-dev -y -q
    sudo apt-get install libxkbcommon-dev -y -q
    sudo apt-get install libczmq-dev -y -q
    sudo apt-get install libiniparser-dev -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Installing php*...$COL_RESET"
    sudo apt-get install php7.3 -y -q
    sudo apt-get install php7.3-fpm -y -q
    sudo apt-get install php7.3-opcache -y -q
    sudo apt-get install php7.3-common -y -q
    sudo apt-get install php7.3-gd -y -q
    sudo apt-get install php7.3-mysql -y -q
    sudo apt-get install php7.3-imap -y -q
    #sudo apt-get install php7.3-cli -y -q
    sudo apt-get install php7.3-cgi -y -q
    sudo apt-get install php7.3-curl -y -q
    sudo apt-get install php7.3-intl -y -q
    sudo apt-get install php7.3-pspell -y -q
    sudo apt-get install php7.3-recode -y -q
    sudo apt-get install php7.3-sqlite3 -y -q
    sudo apt-get install php7.3-tidy -y -q
    sudo apt-get install php7.3-xmlrpc -y -q
    sudo apt-get install php7.3-xsl -y -q
    sudo apt-get install php7.3-zip -y -q
    sudo apt-get install php7.3-mbstring -y -q
    sudo apt-get install php7.3-memcache -y -q
    sudo apt-get install php7.3-memcached -y -q
    sudo apt-get install php-pear -y -q
    sudo apt-get install php-auth-sasl -y -q
    sudo apt-get install php-memcache -y -q
    sudo apt-get install php-imagick -y -q
    sudo apt-get install php-gettext -y -q
    #sudo apt-get install phpmyadmin -y -q
echo -e "$GREEN Done...$COL_RESET"

echo -e "$CYAN Installing updates/upgades for packages...$COL_RESET"
    sudo apt update -y -q
    sudo apt upgrade -y -q
echo -e "$GREEN Done...$COL_RESET"
