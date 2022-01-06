#!/bin/sh

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'perl'
        )
        ;;
    esac
    ;;
esac
