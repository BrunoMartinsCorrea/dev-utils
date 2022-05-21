#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch)
        official_packages+=(
            'k9s'
            'kubeadm'
            'kubectl'
        )
        ;;&
    fedora)
        official_packages+=(
            'https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm'
        )
        ;;&
    ubuntu)
        custom_install_scripts+=(
            'wget -q --show-progress https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb -O minikube.deb'
            'sudo apt install -y ./minikube.deb'
            'rm -f ./minikube.deb'
        )
        ;;&
    arch | fedora)
        official_packages+=(
            'helm'
        )
        ;;&
    fedora | ubuntu)
        official_packages+=(
            'kubernetes'
        )
        ;;
    esac
    ;;
esac
