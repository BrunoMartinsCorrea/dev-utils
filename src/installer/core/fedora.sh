#!/bin/bash

CONFIG_PATH=$INSTALLER_PATH/config/fedora
DNF_CONF=$(cat $CONFIG_PATH/dnf.conf)

official_package_manager='sudo dnf install -y'

pre_official_install_scripts+=(
    'sudo dnf config-manager --set-enabled google-chrome'
    "echo '$DNF_CONF' | sudo tee /etc/dnf/dnf.conf"
    'sudo dnf clean all'
    'sudo dnf makecache'
    'sudo dnf distro-sync -y'
    'sudo dnf install -y fedora-workstation-repositories https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
)

official_packages+=(
    'util-linux-user'
)

post_official_install_scripts+=(
    'sudo dnf autoremove -y'
)
