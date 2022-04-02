#!/bin/bash

ROOT_PATH=$(dirname "$0")
DEV_UTILS_DATA_DIR=$ROOT_PATH
INSTALLER_PATH=$ROOT_PATH/src/installer
SCRIPT_PATH=$ROOT_PATH/src/script
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

if ! [ -d "$DEV_UTILS_DATA_DIR" ]; then
    mkdir -p "$DEV_UTILS_DATA_DIR"
fi

while :; do
    clear
    echo "
╔════════════════════════╗
║  Welcome to dev-utils  ║
╠════════════════════════╣
║ 0. Exit [DEFAULT]      ║
║ 1. Setup my computer   ║
║ 2. Setup my git        ║
║ 3. Setup my OpenVPN    ║
╚════════════════════════╝
"
    read -p "Option: " MENU_OPTION

    if [ "$MENU_OPTION" == "1" ]; then
        source "$INSTALLER_PATH/installer.sh"
    elif [ "$MENU_OPTION" == "2" ]; then
        source "$SCRIPT_PATH/git-utils.sh"
    elif [ "$MENU_OPTION" == "3" ]; then
        source "$SCRIPT_PATH/vpn-utils.sh"
    else
        break
    fi
done
