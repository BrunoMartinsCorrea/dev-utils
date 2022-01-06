#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    *)
        flatpak_packages+=(
            'com.jetbrains.IntelliJ-IDEA-Community'
        )
        ;;
    esac
    ;;
esac
