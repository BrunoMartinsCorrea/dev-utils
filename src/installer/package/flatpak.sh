#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'flatpak'
        )
        pre_flatpak_install_scripts+=(
            'sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo'
            'sudo flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo'
        )
        ;;
    esac
    ;;
esac
