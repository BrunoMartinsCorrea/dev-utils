#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora | ubuntu)
        official_packages+=(
            'consul'
        )
        ;;
    esac
    ;;
esac
