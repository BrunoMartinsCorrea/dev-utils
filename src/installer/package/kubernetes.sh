#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'helm'
            'k9s'
            'kubeadm'
            'kubectl'
        )
        ;;
    fedora | ubuntu)
        official_packages+=(
            'kubernetes'
        )
        ;;
    esac
    ;;
esac
