#!/bin/bash

# Check if exists
if [ -e /etc/systemd/system/ivalice.service ]
then
    echo "Ivalice service already exists!"
    exit
fi
# Make sure its running with root
if [ $EUID != 0 ]
then
  echo "Root permissions required, starting with sudo."
  chmod +x "$0"
  sudo "$0" "$@"
  exit $?
fi
# Check OS (for addding user)
if [ -f /etc/os-release ]
then
    . /etc/os-release
    OS=$ID
    OS_LIKE=$ID_LIKE
fi
PPWD="$(dirname "$(pwd)")"
DEBIAN="^debian|[[:space:]]debian|^ubuntu|[[:space:]]ubuntu"
ARCH="^arch|[[:space:]]arch"
# Try to create new user
echo "Create a user to run the Ivalice service, leave blank for default. (default: topaz)"
echo "WARNING! This user will need access to the current directory."
read -r -p "User: " XI_USER
if [ -z "$XI_USER" ]
then
    XI_USER="ivalice"
fi
if [ $OS = "debian" ] || [[ $OS_LIKE =~ $DEBIAN ]]
then
    adduser --system --no-create-home --group --quiet $XI_USER || true
elif [ $OS = "arch" ] || [[ $OS_LIKE =~ $ARCH ]]
then
    useradd -r -s /usr/bin/nologin $XI_USER || true
else
    echo "Sorry, this OS is unsupported at this time." && exit
fi
# Give user permission to start and stop the service
cat > /etc/sudoers.d/$XI_USER << SUDO
$XI_USER ALL= NOPASSWD: /bin/systemctl restart ivalice.service
$XI_USER ALL= NOPASSWD: /bin/systemctl stop ivalice.service
$XI_USER ALL= NOPASSWD: /bin/systemctl start ivalice.service
SUDO
# Systemd combined service
SYSTEMD_IVALICE="""
[Unit]
Description=Ivalice - FFXI Server Emulator
After=mysql.service

[Service]
Type=oneshot
ExecStart=/bin/true
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
"""
# Systemd game server service
SYSTEMD_GAME="""
[Unit]
Description=ivalice Game Server
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5
PartOf=ivalice.service
After=ivalice.service

[Service]
Type=simple
Restart=always
RestartSec=5
User=$XI_USER
Group=$XI_USER
WorkingDirectory=$PPWD
# For multiple map servers:
# - Make a copy of this file for each server. Rename appropriately, e.g. ivalice_game-cities.service
# - Uncomment line in update.sh 'echo IP=\$IP > ip.txt'.
# - Change the zone ports in zone_settings table. A custom.sql file is useful for this, see update.sh.
# - Run update.sh and change your server IP. Manually type the IP even if you're not changing it.
# - Remove the line below, 'ExecStart=$PPWD/ivalice_game'.
# - Uncomment and edit the 2 lines below with the appropriate port and log location for each zone server.
#EnvironmentFile=$PPWD/ip.txt
#ExecStart=$PPWD/ivalice_game --ip \$IP --port 54230 --log $PPWD/log/map_server.log
ExecStart=$PPWD/ivalice_game

[Install]
WantedBy=ivalice.service
"""
# Systemd connect server service
SYSTEMD_CONNECT="""
[Unit]
Description=ivalice Connect Server
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5
PartOf=ivalice.service
After=ivalice.service

[Service]
Type=simple
Restart=always
RestartSec=5
User=$XI_USER
Group=$XI_USER
WorkingDirectory=$PPWD
ExecStart=$PPWD/ivalice_connect

[Install]
WantedBy=ivalice.service
"""
# Systemd search server service
SYSTEMD_SEARCH="""
[Unit]
Description=ivalice Search Server
Wants=network.target
StartLimitIntervalSec=120
StartLimitBurst=5
PartOf=ivalice.service
After=ivalice.service

[Service]
Type=simple
Restart=always
RestartSec=5
User=$XI_USER
Group=$XI_USER
WorkingDirectory=$PPWD
ExecStart=$PPWD/ivalice_search

[Install]
WantedBy=ivalice.service
"""
# Create services and enable child services
usermod -aG $XI_USER $SUDO_USER
chown -R $XI_USER:$XI_USER $PPWD
chmod -R g=u $PPWD 2>/dev/null
echo "$SYSTEMD_IVALICE" > /etc/systemd/system/ivalice.service
echo "$SYSTEMD_GAME" > /etc/systemd/system/ivalice_game.service
echo "$SYSTEMD_CONNECT" > /etc/systemd/system/ivalice_connect.service
echo "$SYSTEMD_SEARCH" > /etc/systemd/system/ivalice_search.service
chmod 755 /etc/systemd/system/ivalice*
systemctl daemon-reload
systemctl enable ivalice_game ivalice_connect ivalice_search
echo "Services installed!"
echo "Start with 'systemctl start ivalice', enable start on boot with 'systemctl enable ivalice'."