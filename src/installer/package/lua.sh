#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'lua'
        )
        ;;
    ubuntu)
        official_packages+=(
            'lua5.4'
        )
        ;;
    esac
    ;;
esac
