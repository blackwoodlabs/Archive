#!/bin/bash
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[93m'
LRED='\e[91m'
NC='\e[0m' # No Color
ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
NL='\n'
TAB='\t'
if [ "$UID" !=  "$ROOT_UID" ]; then
  echo -e "${NL}${TAB}${LRED}RUN AS ROOT${NC}${NL}"
  exit $E_NOTROOT
else
  echo -e "${NL}${TAB}${GREEN}SUDO_USER == $SUDO_USER${NC}${NL}"  
fi

/bin/bash ./conv-script.sh
/bin/bash ./install-docker-compose.sh
/bin/bash ./docker-adduser.sh
/bin/bash ./run-health-check.sh