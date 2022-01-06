#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    *)
        flatpak_packages+=(
            'com.microsoft.Teams'
        )
        ;;
    esac
    ;;
esac
