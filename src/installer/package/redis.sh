#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                flatpak_packages+=(
                    'dev.rdm.RDM'
                )
                ;;
        esac
        ;;
esac