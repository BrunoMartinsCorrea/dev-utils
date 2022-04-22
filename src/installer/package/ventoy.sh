#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        custom_install_scripts+=(
            'VENTOY_LATEST_VERSION=$(curl -s https://api.github.com/repos/ventoy/Ventoy/releases/latest | jq -r ".assets[].browser_download_url | select(. | test(\"linux\"))")'
            'sudo wget $VENTOY_LATEST_VERSION -O /tmp/ventoy.tar.gz'
            'sudo mkdir -p /opt/ventoy'
            'sudo tar -xf /tmp/ventoy.tar.gz -C /opt/ventoy --strip-components=2'
            'echo -e "[Desktop Entry]\nName=Ventoy\nExec=/opt/ventoy/VentoyGUI.x86_64\nType=Application\nIcon=/opt/ventoy/WebUI/static/img/VentoyLogo.png" | sudo tee -a /usr/share/applications/ventoy.desktop'
        )
        ;;
    esac
    ;;
esac
