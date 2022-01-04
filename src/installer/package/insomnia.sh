#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            *)
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
