#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                pre_install_scripts+=(
                    'sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo'
                )
                official_packages+=(
                    'docker-ce'
                    'docker-ce-cli'
                    'containerd.io'
                    'docker-compose'
                )
                post_install_scripts+=(
                    'sudo usermod -aG docker $USER'
                )
                ;;
        esac
        ;;
esac
