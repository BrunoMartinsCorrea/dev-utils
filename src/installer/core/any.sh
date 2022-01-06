#!/bin/sh

PACKAGES_PATH=$INSTALLER_PATH/package

for package in $(ls $PACKAGES_PATH); do
    source $PACKAGES_PATH/$package
done
