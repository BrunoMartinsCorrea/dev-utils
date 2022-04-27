#!/bin/bash

official_package_manager='sudo apt install -y'

pre_official_install_scripts+=(
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
