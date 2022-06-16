#!/bin/bash

PACKAGES_PATH=$INSTALLER_PATH/package
CONFIG_PATH=$INSTALLER_PATH/config/any

environment_variables+=(
    'export PATH=$PATH:$HOME/.local/bin'
)

for package in $(ls "$PACKAGES_PATH"); do
    source "$PACKAGES_PATH/$package"
done
