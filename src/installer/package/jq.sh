#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch | fedora | ubuntu)
        official_packages+=(
            'jq'
        )
        ;;
    esac
    ;;
esac
