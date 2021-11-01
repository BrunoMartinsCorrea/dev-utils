#!/bin/sh

official_package_manager='sudo dnf install -y'

pre_install_scripts+=(
    'echo "fastestmirror=1" | sudo tee -a /etc/dnf/dnf.conf'
    'sudo dnf clean all'
    'sudo dnf install fedora-workstation-repositories'
    'sudo dnf config-manager --set-enabled google-chrome'
    'sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
    'sudo dnf makecache'
    'sudo dnf distro-sync -y'
)

post_install_scripts+=(
    'sudo dnf autoremove -y'
)
