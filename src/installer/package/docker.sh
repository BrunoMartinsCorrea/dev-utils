#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                pre_official_install_scripts+=(
                    'sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo'
                )
                official_packages+=(
                    'docker-ce'
                    'docker-ce-cli'
                    'containerd.io'
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
