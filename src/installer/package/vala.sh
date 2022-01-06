#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'vala'
            'ninja-build'
            'meson'
        )
        ;;
    esac
    ;;
esac
