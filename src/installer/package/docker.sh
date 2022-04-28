#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        pre_official_install_scripts+=(
            'sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo'
        )
        official_packages+=(
            'docker-ce'
            'docker-ce-cli'
            'containerd.io'
        )
        ;;&
    ubuntu)
        official_packages+=(
            'docker.io'
            'containerd'
        )
        ;;&
    fedora | ubuntu)
        official_packages+=(
            'docker-compose'
        )
        post_official_install_scripts+=(
            'sudo systemctl start docker'
            'sudo systemctl enable docker'
            'sudo usermod -aG docker $USER'
        )
        ;;
    esac
    ;;
esac
