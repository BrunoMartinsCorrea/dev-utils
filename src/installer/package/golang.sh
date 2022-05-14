#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'go'
        )
        ;;
    fedora | ubuntu)
        official_packages+=(
            'golang'
        )
        ;;
    esac
    ;;
esac
