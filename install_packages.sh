ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
RED=$ESC_SEQ"31;01m"
GREEN=$ESC_SEQ"32;01m"
YELLOW=$ESC_SEQ"33;01m"
BLUE=$ESC_SEQ"34;01m"
MAGENTA=$ESC_SEQ"35;01m"
CYAN=$ESC_SEQ"36;01m"

echo -e "$CYAN Removing Apache...$COL_RESET"
    sudo apt-get purge apache2 -y
    sudo apt-get purge apache2-* -y
    sudo apt-get --purge autoremove -y
echo -e "$GREEN Done. Removing Apache...$COL_RESET"

echo -e "$CYAN Installing MariaDB Repository...$COL_RESET"
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.one.com/mariadb/repo/10.4/ubuntu bionic main' >/dev/null 2>&1
echo -e "$GREEN Done. Installing MariaDB Repository...$COL_RESET"

echo -e "$CYAN Install software-properties-common...$COL_RESET"
    sudo apt-get install software-properties-common -y
echo -e "$GREEN Done. Install software-properties-common...$COL_RESET"

echo -e "$CYAN Install certbot...$COL_RESET"
    sudo add-apt-repository ppa:certbot/certbot -y
    sudo apt-get install python-certbot-nginx -y
    sudo apt-get install ca-certificates -y
    sudo apt-get install certbot -y
echo -e "$GREEN Done. Install certbot...$COL_RESET"

echo -e "$CYAN Installing ppa:bitcoin/bitcoin...$COL_RESET"
    sudo add-apt-repository ppa:bitcoin/bitcoin -y
echo -e "$GREEN Done. Installing ppa:bitcoin/bitcoin...$COL_RESET"

echo -e "$CYAN Installing ppa:ondrej/php...$COL_RESET"
    sudo add-apt-repository ppa:ondrej/php -y
echo -e "$GREEN Done. Installing ppa:ondrej/php...$COL_RESET"

echo -e "$CYAN Installing wireguard...$COL_RESET"
    sudo apt-get install wireguard -y
    sudo apt-get install wireguard-dkms -y
echo -e "$GREEN Done. Installing wireguard...$COL_RESET"

echo -e "$CYAN Installing packages*...$COL_RESET"
    sudo apt-get install git -y
    sudo apt-get install nano -y
    sudo apt-get install dialog -y
    sudo apt-get install build-essential -y
    sudo apt-get install autotools-dev -y
    sudo apt-get install automake -y
    sudo apt-get install pkg-config -y
    sudo apt-get install bsdmainutils -y
    sudo apt-get install python3 -y
    sudo apt-get install python3-dev -y
    sudo apt-get install python3-pip -y
    #sudo apt-get install wget -y
    #sudo apt-get install bc -y
    sudo apt-get install mcrypt -y
    sudo apt-get install imagemagick -y
    sudo apt-get install memcached -y
    sudo apt-get install curl -y
    sudo apt-get install zip -y
    sudo apt-get install unzip -y
    sudo apt-get install rar -y
    #sudo apt-get install vim -y
    sudo apt-get install fail2ban -y
    sudo apt-get install ufw -y
    sudo apt-get install qttools5-dev -y
    sudo apt-get install qttools5-dev-tools -y
    #sudo apt-get install qtbase5-dev -y
    sudo apt-get install protobuf-compiler -y
    sudo apt-get install update-motd -y
    sudo apt-get install haveged -y
    #sudo apt-get install coreutils -y
    #sudo apt-get install pollinate -y
    #sudo apt-get install unattended-upgrades -y
    #sudo apt-get install cron -y
    sudo apt-get install pwgen -y
    #sudo apt-get install rsyslog -y
    sudo apt-get install cmake -y
    sudo apt-get install gnupg2 -y
    #sudo apt-get install acl -y
    #sudo apt-get install update-notifier-common -y
    #sudo apt-get install lsb-release -y
    #sudo apt-get install landscape-common -y
    #sudo apt-get install screen -y
    sudo apt-get install cifs-utils -y
    sudo apt-get install traceroute -y
    sudo apt-get install bison -y
    sudo apt-get install xcb-proto -y
    #sudo apt-get install x11proto-xext-dev -y
    #sudo apt-get install x11proto-dev -y
    #sudo apt-get install xtrans-dev -y
    sudo apt-get install zlib1g-dev -y
    #sudo apt-get install autoconf -y
    sudo apt-get install dh-autoreconf -y
    sudo apt-get install apt-transport-https -y
    sudo apt-get install gnutls-dev -y
    sudo apt-get install figlet -y
    sudo apt-get install sendmail -y
    sudo apt-get install ntp -y
    sudo apt-get install ntpdate -y
echo -e "$GREEN Done. Installing packages*...$COL_RESET"

echo -e "$CYAN Installing lib*...$COL_RESET"
    sudo apt-get install libdb4.8-dev -y
    sudo apt-get install libdb4.8++-dev -y
    sudo apt-get install libdb5.1 -y
    sudo apt-get install libdb5.1++ -y
    sudo apt-get install libdb5.3 -y
    sudo apt-get install libdb5.3++ -y
    sudo apt-get install libdb5.3++-dev -y
    sudo apt-get install libtool -y
    sudo apt-get install libssl-dev -y
    sudo apt-get install libevent-dev -y
    sudo apt-get install libboost-system-dev -y
    sudo apt-get install libboost-filesystem-dev -y
    sudo apt-get install libboost-chrono-dev -y
    sudo apt-get install libboost-test-dev -y
    sudo apt-get install libboost-thread-dev -y
    sudo apt-get install libboost-all-dev -y
    sudo apt-get install libcurl4-gnutls-dev -y
    sudo apt-get install libruby -y
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
echo -e "$GREEN Done. Installing lib*...$COL_RESET"

echo -e "$CYAN Installing php*...$COL_RESET"
    sudo apt-get install php7.3 -y
    sudo apt-get install php7.3-fpm -y
    sudo apt-get install php7.3-opcache -y
    sudo apt-get install php7.3-common -y
    sudo apt-get install php7.3-gd -y
    sudo apt-get install php7.3-mysql -y
    sudo apt-get install php7.3-imap -y
    #sudo apt-get install php7.3-cli -y
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
    sudo apt-get install php7.3-memcached -y
    sudo apt-get install php-pear -y
    sudo apt-get install php-auth-sasl -y
    sudo apt-get install php-memcache -y
    sudo apt-get install php-imagick -y
    sudo apt-get install php-gettext -y
    #sudo apt-get install phpmyadmin -y
echo -e "$GREEN Done. Installing php*...$COL_RESET"

echo -e "$CYAN Installing NGINX...$COL_RESET"
    sudo apt-get purge apache2 -y
    sudo apt-get purge apache2-* -y
    sudo apt-get install nginx -y
echo -e "$GREEN Done. Installing NGINX...$COL_RESET"


echo -e "$CYAN Installing updates/upgades for packages...$COL_RESET"
    sudo apt update -y
    sudo apt upgrade -y
echo -e "$GREEN Done. Installing updates/upgades for packages...$COL_RESET"
