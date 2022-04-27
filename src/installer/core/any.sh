#!/bin/bash

PACKAGES_PATH=$INSTALLER_PATH/package
CONFIG_PATH=$INSTALLER_PATH/config/any

pre_official_install_scripts+=(
    'sudo mkdir -p /etc/gdm/db/gdm.d'
)

for package in $(ls "$PACKAGES_PATH"); do
    source "$PACKAGES_PATH/$package"
done
