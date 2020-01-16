#!/bin/bash
# Make sure its running with root
if [[ $EUID != 0 ]]; then
  printf "Root permissions required, starting with sudo\n\n"
  chmod +x "$0"
  sudo "$0" "$@"
  exit $?
fi
# Static script Options
APT_GET_INSTALL_ONE="nano git mariadb-client mariadb-server libmariadb-dev libmariadbclient-dev libssl-dev"
APT_GET_INSTALL_TWO="luajit lua5.1 liblua5.1-dev libzmq3-dev autoconf pkg-config gcc build-essential"
INSTALL_DIR="/opt/darkstar"
# User set options (These are replaced by user input later in the script)
DARKSTAR_USER="darkstar"
DARKSTAR_PASSWORD="darkstar"
DARKSTAR_IP="127.0.0.1"
# Start of Script
clear
printf "This script will install Darkstar's FFXI Private Server."
printf "\nSupported Operating Systems: Debian, Ubuntu, Raspbian\n\n"
printf "1. Install Darkstar & Dependencies\n"
printf "2. Update Configurations Only\n"
printf "3. Restart Darkstar Server\n"
printf "4. Shutdown Darkstar Server & Disable Auto Start\n"
printf "5. Start Darkstar Server & Enable Auto Start\n"
printf "6. Exit\n\n"
read -p "Please enter the number of one of the above Options: " -n 1 -r RUN_CHOICE
if [ "${RUN_CHOICE}" == "1" ]; then
  if [ -f /opt/darkstar/dsgame ]; then
    printf "\n\nPrevious install detected - Upgrades are not supported\nExiting script\n"
    exit
  fi
  printf "\n\n1. Stable Version\n"
  printf "2. Development Version\n\n"
  read -p "Would you like to install the Stable or Development versions?: " -n 1 -r GIT_VERSION
  printf "\n\nEnter a username for running the server and logging into the SQL database.\n"
  read -r -p "Username: " DARKSTAR_USER
  echo
  read -r -p "'${DARKSTAR_USER}' User's Password: " DARKSTAR_PASSWORD
  OS=$(awk '/^ID=/' /etc/os-release | sed 's/ID=//')
  printf "\nDetected OS: %s\n\nInstalling Dependencies, please wait ...\n\n" "${OS}"
  add-apt-repository universe > /dev/null 2>&1
  add-apt-repository multiverse > /dev/null 2>&1
  # shellcheck disable=SC2086
  apt-get -qq update && apt-get -qq install ${APT_GET_INSTALL_ONE} ${APT_GET_INSTALL_TWO} || exit
  echo
  adduser "${DARKSTAR_USER}" --gecos "Darkstar Server" --disabled-password || exit
  echo
  if [[ ${GIT_VERSION} == "1" ]]; then
    git clone --branch stable --recursive https://github.com/DarkstarProject/darkstar/ /opt/darkstar
  else
    git clone --recursive https://github.com/DarkstarProject/darkstar/ /opt/darkstar
  fi
  cd /opt/darkstar || exit
  sh autogen.sh || exit
  if [ "${OS}" == "debian" ] || [ "${OS}" == "raspbian" ]; then
    printf "\nRunning Debian or Raspbian Install\n"
    apt-get -y install libmariadb-dev-compat
    ./configure CXXFLAGS=" -pthread" || exit
  else
    printf "\nRunning Default Install\n"
    ./configure || exit
  fi
  make -j4 || exit
  chown -R "${DARKSTAR_USER}":root /opt/darkstar/
  printf "\nEnter the MySQL root password\nDefault: No password\n"
  mysql -h "localhost" -u "root" -p -e "CREATE USER '${DARKSTAR_USER}'@'localhost' IDENTIFIED BY '${DARKSTAR_PASSWORD}';CREATE DATABASE dspdb;USE dspdb;GRANT ALL PRIVILEGES ON dspdb.* TO '${DARKSTAR_USER}'@'localhost';"
  printf "\n"
  cd ${INSTALL_DIR}/sql || exit
  for SQL_FILE in *.sql
    do
      echo -n "Importing $SQL_FILE into the database..."
      mysql dspdb -u "${DARKSTAR_USER}" "-p${DARKSTAR_PASSWORD}" < "$SQL_FILE" && echo "Success"
    done
  cd ..
  # Systemd service files to be written
  SYSTEMD_SERVICE_DSCONNECT="""
[Unit]
Description=Darkstar Final Fantasy XI - DS Connect
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5

[Service]
Type=simple
Restart=always
RestartSec=5
User=${DARKSTAR_USER}
Group=${DARKSTAR_USER}
WorkingDirectory=/opt/darkstar
ExecStart=/opt/darkstar/dsconnect

[Install]
WantedBy=multi-user.target
"""
  SYSTEMD_SERVICE_DSGAME="""
[Unit]
Description=Darkstar Final Fantasy XI - DS Game
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5

[Service]
Type=simple
Restart=always
RestartSec=5
User=${DARKSTAR_USER}
Group=${DARKSTAR_USER}
WorkingDirectory=/opt/darkstar
ExecStart=/opt/darkstar/dsgame

[Install]
WantedBy=multi-user.target
"""
  SYSTEMD_SERVICE_DSSEARCH="""
[Unit]
Description=Darkstar Final Fantasy XI - DS Search
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5

[Service]
Type=simple
Restart=always
RestartSec=5
User=${DARKSTAR_USER}
Group=${DARKSTAR_USER}
WorkingDirectory=/opt/darkstar
ExecStart=/opt/darkstar/dssearch

[Install]
WantedBy=multi-user.target
"""
  printf "%s" "${SYSTEMD_SERVICE_DSCONNECT}" > /etc/systemd/system/darkstar-connect.service
  printf "%s" "${SYSTEMD_SERVICE_DSGAME}" > /etc/systemd/system/darkstar-game.service
  printf "%s" "${SYSTEMD_SERVICE_DSSEARCH}" > /etc/systemd/system/darkstar-search.service
  chmod 755 /etc/systemd/system/darkstar*
  systemctl daemon-reload
  printf "\n\nInstallation Complete\n"
fi
chmod 775 /opt/darkstar -R 2>/dev/null
echo
if [ "${RUN_CHOICE}" == "1" ] || [ "${RUN_CHOICE}" == "2" ]; then
  read -p "Would you like to update the Darkstar FFXI zone IP? (Y/N) " -n 1 -r ZONEIP
  echo
  if [[ ${ZONEIP} =~ ^[Yy]$ ]]; then
    printf "\nYour current systems IPv4 Address are as follows\n"
    ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
    echo
    read -r -p "Enter the IP address you wish to use with this Server: " DARKSTAR_IP
    printf "\nEnter the MySQL root password\nDefault: No password\n"
    mysql -h "localhost" -u "root" -p -e "USE dspdb;UPDATE zone_settings SET zoneip = '${DARKSTAR_IP}';"
  fi
  clear
  printf "\nYou now need to update the SQL username and password in 3 configuration files.\n"
  printf "Everything else is optional. Each file will be opened automatically one after the other.\n"
  printf "nano is used to edit files.\nPress CTRL+X when done, then follow instructions, making sure to save changes.\n\n"
  read -rsp "Press any key to begin editing configuration files" -n 1
  nano ${INSTALL_DIR}/conf/login_darkstar.conf
  nano ${INSTALL_DIR}/conf/map_darkstar.conf
  nano ${INSTALL_DIR}/conf/search_server.conf
fi
if [ "${RUN_CHOICE}" == "3" ] || [ "${RUN_CHOICE}" == "2" ]; then
  printf "\nRestarting Darkstar Server\n"
  systemctl restart darkstar-connect
  systemctl restart darkstar-game
  systemctl restart darkstar-search
elif [ "${RUN_CHOICE}" == "4" ]; then
  printf "\nShutting Down Darkstar Server & Disabling Auto Start\n\n"
  systemctl disable darkstar-connect
  systemctl disable darkstar-game
  systemctl disable darkstar-search
  systemctl stop darkstar-connect
  systemctl stop darkstar-game
  systemctl stop darkstar-search
elif [ "${RUN_CHOICE}" == "5" ] || [ "${RUN_CHOICE}" == "1" ]; then
  printf "\nStarting Darkstar Server & Enabling Auto Start\n\n"
  systemctl enable darkstar-connect
  systemctl enable darkstar-game
  systemctl enable darkstar-search
  systemctl start darkstar-connect
  systemctl start darkstar-game
  systemctl start darkstar-search
else
  printf "\nExiting\n"
  exit
fi
