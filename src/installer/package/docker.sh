#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                pre_install_scripts=$pre_install_scripts'
                    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
                '
                official_packages=$official_packages' docker-ce docker-ce-cli containerd.io'
                post_install_scripts=$post_install_scripts'
                    sudo usermod -aG docker $USER
                '
                ;;
        esac
        ;;
esac
