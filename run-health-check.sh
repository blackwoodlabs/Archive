#!/bin/bash
#Checks to see if services are running
#Colors
RED='\e[31m'
GREEN='\e[32m'
ORANGE='\e[33m'
YELLOW='\e[93m'
LRED='\e[91m'
NC='\e[0m' # No Color
#Check services are configured to start on boot
systemctl is-enabled --quiet docker.service && echo -e "${NL}${TAB}${GREEN}DOCKER.SERVICE is RUNNING${NC}${NL}" || echo -e "${NL}${TAB}${LRED}DOCKER.SERVICE NOT RUNNING - Start Manually${NC}${NL}"
systemctl is-enabled --quiet docker.service && echo -e "${NL}${TAB}${GREEN}CONTAINERD is RUNNING${NC}${NL}" || echo -e "${NL}${TAB}${LRED}CONTAINERD NOT RUNNING - Start Manually${NC}${NL}"
# Test the installation.
docker-compose --version
# Validate that docker-compose will run as non-root
sudo -u $SUDO_USER bash <<"DOF"
RED='\e[31m'
GREEN='\e[32m'
ORANGE='\e[33m'
YELLOW='\e[93m'
LRED='\e[91m'
NC='\e[0m' # No Color
echo -e "${NL}${TAB}${ORANGE}RUNNING as $USER${NC}${NL}"
docker run hello-world
id -nGz "$USER" | grep -qzxF "docker" && echo -e "${NL}${TAB}${GREEN}USER in \"DOCKER\" GROUP${NC}${NL}" || echo -e "${NL}${TAB}${LRED}USER NOT IN \"DOCKER\" GROUP${NC}${NL}"
DOF
exit 0
