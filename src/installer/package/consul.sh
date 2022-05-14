#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'consul-bin'
        )
        ;;
    fedora | ubuntu)
        official_packages+=(
            'consul'
        )
        ;;
    esac
    ;;
esac
