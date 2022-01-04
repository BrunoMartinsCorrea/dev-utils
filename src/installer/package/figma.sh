#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            *)
                flatpak_packages+=(
                    'io.github.Figma_Linux.figma_linux'
                )
                ;;
        esac
        ;;
esac
