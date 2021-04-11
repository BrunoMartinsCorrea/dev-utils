#!/bin/bash
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

mapfile -t VPN_FILES < <(find ~ -name "*.ovpn" 2>/dev/null)

if [ -n "$VPN_FILES" ]; then
    echo -e "Choose a file to import...\n"

    select VPN_FILE in "${VPN_FILES[@]}";
    do
        test -z "$VPN_FILE" && break
        echo -e "\n${YELLOW}Importing $VPN_FILE...${NO_COLOR}\n"

        read -p "Type your VPN username: " VPN_USERNAME
        read -sp "Type your VPN password: " VPN_PASSWORD
        echo
        read -p "Type your VPN alias: " VPN_ALIAS

        VPN_UUID=$(nmcli connection import type openvpn file "$VPN_FILE" 2>/dev/null | grep -Po "(\w+-)+\w+")

        if [ -n "$VPN_UUID" ]; then
            nmcli connection modify "$VPN_UUID" connection.id "$VPN_ALIAS"
            nmcli connection modify "$VPN_UUID" +vpn.data username=$VPN_USERNAME
            nmcli connection modify "$VPN_UUID" +vpn.secrets "password=$VPN_PASSWORD"
            nmcli connection modify "$VPN_UUID" ipv4.never-default true
            nmcli connection modify "$VPN_UUID" ipv6.never-default true

            echo -e "\n${GREEN}VPN created!${NO_COLOR}"
        else
            echo -e "\n${RED}Oops! Something went wrong!${NO_COLOR}"
            exit 1
        fi
        break
    done
else
    echo -e "${RED}Oops! I didn't find any .ovpn file...${NO_COLOR}"
    exit 1
fi
