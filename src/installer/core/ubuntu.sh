#!/bin/bash

official_package_manager='sudo apt install -y'

pre_official_install_scripts+=(
    'wget -qO- https://apt.releases.hashicorp.com/gpg | gpg --dearmor > packages.hashicorp.gpg'
    'sudo install -o root -g root -m 644 packages.hashicorp.gpg /etc/apt/trusted.gpg.d/'
    'rm -f packages.hashicorp.gpg'
    'sudo apt-add-repository -y "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"'
    'sudo apt update -y'
    'sudo apt full-upgrade -y'
)

official_packages+=(
    'util-linux'
)

post_official_install_scripts+=(
    'sudo apt autoremove -y'
    'sudo apt autoclean -y'
)
