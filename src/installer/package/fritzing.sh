#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                flatpak_packages+=(
                    'org.fritzing.Fritzing'
                )
                ;;
        esac
        ;;
esac
