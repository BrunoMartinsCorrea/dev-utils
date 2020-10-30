VPN_FILE=$(ls *.ovpn 2> /dev/null | head -1)
if [ -n "$VPN_FILE" ]; then
    echo "Importing $VPN_FILE...\n"

    echo "Type your VPN username: "
    read VPN_USERNAME

    echo "Type your VPN password: "
    read -s VPN_PASSWORD

    echo "Type your VPN alias: "
    read VPN_ALIAS

    VPN_UUID=$(nmcli connection import type openvpn file ./$VPN_FILE | grep -Po "(?<=\()(\w+-?)+")
    nmcli connection modify $VPN_UUID connection.id "$VPN_ALIAS"
    nmcli connection modify $VPN_UUID ipv4.never-default true
    nmcli connection modify $VPN_UUID ipv6.never-default true
    nmcli connection modify $VPN_UUID +vpn.data username=$VPN_USERNAME
    nmcli connection modify $VPN_UUID vpn.secrets "password=$VPN_PASSWORD"
else
    echo "Ops! Where is the ovpn file?"
fi
