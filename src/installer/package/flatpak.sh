#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                official_packages+=(
                    'flatpak'
                )
                post_install_scripts+=(
                    'flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo'
                )
                ;;
        esac
        ;;
esac
