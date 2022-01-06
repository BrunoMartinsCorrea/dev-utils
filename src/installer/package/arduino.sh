#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    *)
        flatpak_packages+=(
            'cc.arduino.arduinoide'
        )
        post_flatpak_install_scripts+=(
            'sudo usermod -aG dialout $USER'
        )
        ;;
    esac
    ;;
esac
