#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'google-chrome'
        )
        environment_variables+=(
            'export CHROME_EXECUTABLE=google-chrome-stable'
        )
        ;;
    fedora | ubuntu)
        flatpak_packages+=(
            'com.google.Chrome'
        )
        environment_variables+=(
            'export CHROME_EXECUTABLE=/var/lib/flatpak/exports/bin/com.google.Chrome'
        )
        ;;
    esac
    ;;
esac
