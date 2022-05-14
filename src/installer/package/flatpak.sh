#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch | fedora | ubuntu)
        official_packages+=(
            'flatpak'
        )
        pre_flatpak_install_scripts+=(
            'sudo flatpak remote-delete flathub'
            'sudo flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo'
        )
        ;;
    esac
    ;;
esac
