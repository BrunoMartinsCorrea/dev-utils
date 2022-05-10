#!/bin/bash

CONFIG_PATH=$INSTALLER_PATH/config/fedora
DNF_CONF=$(cat "$CONFIG_PATH/dnf.conf")

official_package_manager='sudo dnf install --skip-broken -by'

pre_official_install_scripts+=(
    "echo '$DNF_CONF' | sudo tee /etc/dnf/dnf.conf"
    'sudo dnf clean all'
    'sudo dnf makecache'
    'sudo dnf upgrade -y'
    'sudo dnf install --skip-broken -by dnf-plugins-core dnf-plugin-system-upgrade fedora-workstation-repositories https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
    'sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo'
)

official_packages+=(
    'util-linux-user'
)

post_official_install_scripts+=(
    'sudo dnf autoremove -y'
)
