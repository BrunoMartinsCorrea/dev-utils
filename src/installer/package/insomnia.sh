#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'insomnia-bin'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'rest.insomnia.Insomnia'
        )
        post_flatpak_install_scripts+=(
            'sudo flatpak override rest.insomnia.Insomnia --filesystem=home'
        )
        ;;
    esac
    ;;
esac
