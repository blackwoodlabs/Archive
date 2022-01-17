#!/bin/bash
RED='\e[31m'
GREEN='\e[32m'
ORANGE='\e[33m'
BLUE=='\e[34m'
YELLOW='\e[93m'
CYAN='\e[36m'
LRED='\e[91m'
NC='\e[0m' # No Color
ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
NL='\n'
TAB='\t'
if [ $(getent group docker) ]; then
  echo -e "${NL}${TAB}${GREEN}Group \"docker\" exists${NC}${NL}"
else
  groupadd docker
  echo -e "${NL}${TAB}${GREEN}Group \"docker\" created${NC}${NL}"
fi
if id -nGz "$SUDO_USER" | grep -qzxF "docker"
then
  echo -e "${TAB}${YELLOW}${SUDO_USER} already in \"docker\" ${NC}${NL}"
else
  usermod -aG docker $SUDO_USER
  echo -e "${TAB}${GREEN}${SUDO_USER} added to group \"docker\" ${NC}${NL}"
fi
newgrp docker << EONG
echo -e "${TAB}${GREEN}group \"docker\" updated ${NC}${NL}"
EONG
exit 0