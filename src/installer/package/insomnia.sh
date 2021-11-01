#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                flatpak_packages+=(
                    'rest.insomnia.Insomnia'
                )
                post_install_scripts+=(
                    'sudo flatpak override rest.insomnia.Insomnia --filesystem=home'
                )
                ;;
        esac
        ;;
esac