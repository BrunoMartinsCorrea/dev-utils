#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    ubuntu)
        official_packages+=(
            'lua5.4'
        )
        ;;
    arch | fedora)
        official_packages+=(
            'lua'
        )
        ;;
    esac
    ;;
esac
