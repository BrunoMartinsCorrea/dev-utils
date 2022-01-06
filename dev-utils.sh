#!/bin/bash

DEV_UTILS_DIR="$HOME/.local/dev-utils"
ROOT_PATH=$(dirname $0)
INSTALLER_PATH=$ROOT_PATH/src/installer
SCRIPT_PATH=$ROOT_PATH/src/script
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

mkdir -p $DEV_UTILS_DIR

while :; do
    clear
    echo "
╔══════════════════════╗
║ Welcome to dev-utils ║
╠══════════════════════╣
║ 0. Exit [DEFAULT]    ║
║ 1. Setup my computer ║
║ 2. Setup my git      ║
╚══════════════════════╝
"
    read -p "Option: " MENU_OPTION

    if [ "$MENU_OPTION" == "1" ]; then
        source $INSTALLER_PATH/installer.sh
    elif [ "$MENU_OPTION" == "2" ]; then
        echo "Setup my git"
        read
    else
        break
    fi
done
