#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
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
