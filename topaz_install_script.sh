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
INSTALL_DIR="/opt/topaz"
# User set options (These are replaced by user input later in the script)
TOPAZ_USER="topaz"
TOPAZ_PASSWORD="topaz"
TOPAZ_IP="127.0.0.1"
# Start of Script
clear
printf "This script will install Project Topaz."
printf "\nSupported Operating Systems: Debian, Ubuntu, Raspbian\n\n"
printf "1. Install Topaz & Dependencies\n"
printf "2. Update Configurations Only\n"
printf "3. Restart Topaz Server\n"
printf "4. Shutdown Topaz Server & Disable Auto Start\n"
printf "5. Start Topaz Server & Enable Auto Start\n"
printf "6. Exit\n\n"
read -p "Please enter the number of one of the above Options: " -n 1 -r RUN_CHOICE
if [ "${RUN_CHOICE}" == "1" ]; then
  if [ -f /opt/topaz/topaz_game ]; then
    printf "\n\nPrevious install detected - Upgrades are not supported\nExiting script\n"
    exit
  fi
  printf "\n\n1. Stable Version\n"
  printf "2. Development Version\n\n"
  read -p "Would you like to install the Stable or Development versions?: " -n 1 -r GIT_VERSION
  printf "\n\nEnter a username for running the server and logging into the SQL database.\n"
  read -r -p "Username: " TOPAZ_USER
  echo
  read -r -p "'${TOPAZ_USER}' User's Password: " TOPAZ_PASSWORD
  OS=$(awk '/^ID=/' /etc/os-release | sed 's/ID=//')
  printf "\nDetected OS: %s\n\nInstalling Dependencies, please wait ...\n\n" "${OS}"
  add-apt-repository universe > /dev/null 2>&1
  add-apt-repository multiverse > /dev/null 2>&1
  # shellcheck disable=SC2086
  apt-get -qq update && apt-get -qq install ${APT_GET_INSTALL_ONE} ${APT_GET_INSTALL_TWO} || exit
  echo
  adduser "${TOPAZ_USER}" --gecos "Topaz Server" --disabled-password || exit
  echo
  if [[ ${GIT_VERSION} == "1" ]]; then
    git clone --branch stable --recursive https://github.com/project-topaz/topaz/ /opt/topaz
  else
    git clone --recursive https://github.com/project-topaz/topaz/ /opt/topaz
  fi
  cd /opt/topaz || exit
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
  chown -R "${TOPAZ_USER}":root /opt/topaz/
  printf "\nEnter the MySQL root password\nDefault: No password\n"
  mysql -h "localhost" -u "root" -p -e "CREATE USER '${TOPAZ_USER}'@'localhost' IDENTIFIED BY '${TOPAZ_PASSWORD}';CREATE DATABASE tpzdb;USE tpzdb;GRANT ALL PRIVILEGES ON tpzdb.* TO '${TOPAZ_USER}'@'localhost';"
  printf "\n"
  cd ${INSTALL_DIR}/sql || exit
  for SQL_FILE in *.sql
    do
      echo -n "Importing $SQL_FILE into the database..."
      mysql tpzdb -u "${TOPAZ_USER}" "-p${TOPAZ_PASSWORD}" < "$SQL_FILE" && echo "Success"
    done
  cd ..
  # Systemd service files to be written
  SYSTEMD_SERVICE_TOPAZ_CONNECT="""
[Unit]
Description=topaz Final Fantasy XI - Topaz Connect
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5

[Service]
Type=simple
Restart=always
RestartSec=5
User=${TOPAZ_USER}
Group=${TOPAZ_USER}
WorkingDirectory=/opt/topaz
ExecStart=/opt/topaz/topaz_connect

[Install]
WantedBy=multi-user.target
"""
  SYSTEMD_SERVICE_TOPAZ_GAME="""
[Unit]
Description=topaz Final Fantasy XI - Topaz Game
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5

[Service]
Type=simple
Restart=always
RestartSec=5
User=${TOPAZ_USER}
Group=${TOPAZ_USER}
WorkingDirectory=/opt/topaz
ExecStart=/opt/topaz/topaz_game

[Install]
WantedBy=multi-user.target
"""
  SYSTEMD_SERVICE_TOPAZ_SEARCH="""
[Unit]
Description=topaz Final Fantasy XI - Topaz Search
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5

[Service]
Type=simple
Restart=always
RestartSec=5
User=${TOPAZ_USER}
Group=${TOPAZ_USER}
WorkingDirectory=/opt/topaz
ExecStart=/opt/topaz/topaz_search

[Install]
WantedBy=multi-user.target
"""
  printf "%s" "${SYSTEMD_SERVICE_TOPAZ_CONNECT}" > /etc/systemd/system/topaz_connect.service
  printf "%s" "${SYSTEMD_SERVICE_TOPAZ_GAME}" > /etc/systemd/system/topaz_game.service
  printf "%s" "${SYSTEMD_SERVICE_TOPAZ_SEARCH}" > /etc/systemd/system/topaz_search.service
  chmod 755 /etc/systemd/system/topaz*
  systemctl daemon-reload
  printf "\n\nInstallation Complete\n"
fi
chmod 775 /opt/topaz -R 2>/dev/null
echo
if [ "${RUN_CHOICE}" == "1" ] || [ "${RUN_CHOICE}" == "2" ]; then
  read -p "Would you like to update the topaz FFXI zone IP? (Y/N) " -n 1 -r ZONEIP
  echo
  if [[ ${ZONEIP} =~ ^[Yy]$ ]]; then
    printf "\nYour current systems IPv4 Address are as follows\n"
    ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
    echo
    read -r -p "Enter the IP address you wish to use with this Server: " TOPAZ_IP
    printf "\nEnter the MySQL root password\nDefault: No password\n"
    mysql -h "localhost" -u "root" -p -e "USE tpzdb;UPDATE zone_settings SET zoneip = '${TOPAZ_IP}';"
  fi
  clear
  printf "\nYou now need to update the SQL username and password in 3 configuration files.\n"
  printf "Everything else is optional. Each file will be opened automatically one after the other.\n"
  printf "nano is used to edit files.\nPress CTRL+X when done, then follow instructions, making sure to save changes.\n\n"
  read -rsp "Press any key to begin editing configuration files" -n 1
  nano ${INSTALL_DIR}/conf/login.conf
  nano ${INSTALL_DIR}/conf/map.conf
  nano ${INSTALL_DIR}/conf/search_server.conf
fi
if [ "${RUN_CHOICE}" == "3" ] || [ "${RUN_CHOICE}" == "2" ]; then
  printf "\nRestarting Topaz Server\n"
  systemctl restart topaz_connect
  systemctl restart topaz_game
  systemctl restart topaz_search
elif [ "${RUN_CHOICE}" == "4" ]; then
  printf "\nShutting Down topaz Server & Disabling Auto Start\n\n"
  systemctl disable topaz_connect
  systemctl disable topaz_game
  systemctl disable topaz_search
  systemctl stop topaz_connect
  systemctl stop topaz_game
  systemctl stop topaz_search
elif [ "${RUN_CHOICE}" == "5" ] || [ "${RUN_CHOICE}" == "1" ]; then
  printf "\nStarting topaz Server & Enabling Auto Start\n\n"
  systemctl enable topaz_connect
  systemctl enable topaz_game
  systemctl enable topaz_search
  systemctl start topaz_connect
  systemctl start topaz_game
  systemctl start topaz_search
else
  printf "\nExiting\n"
  exit
fi
