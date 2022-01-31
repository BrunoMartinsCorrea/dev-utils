#!/bin/bash

PACKAGES_PATH=$INSTALLER_PATH/package
CONFIG_PATH=$INSTALLER_PATH/config/any

for package in $(ls $PACKAGES_PATH); do
    source $PACKAGES_PATH/$package
done
