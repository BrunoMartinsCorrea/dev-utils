#!/bin/bash

official_package_manager='paru -Syuq --needed --sudoloop --noconfirm --noprogressbar'

pre_official_install_scripts+=(
    'sudo pacman -Syuq --needed --noconfirm --noprogressbar pacman-contrib base-devel posix-user-portability cmake git rustup'
    'curl -s https://archlinux.org/mirrorlist/\?country\=BR | sed "s/^#Server/Server/" | sudo tee /etc/pacman.d/mirrorlist'
    'rankmirrors /etc/pacman.d/mirrorlist'
    'rustup install stable'
    'rustup default stable'
    'rustup component add rls'
)

post_official_install_scripts+=(
    'sudo pacman -Scq --noconfirm'
)
