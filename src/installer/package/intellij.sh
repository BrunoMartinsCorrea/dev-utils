#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            *)
                flatpak_packages+=(
                    'com.jetbrains.IntelliJ-IDEA-Community'
                )
                ;;
        esac
        ;;
esac
