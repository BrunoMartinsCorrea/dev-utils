#!/bin/bash

PACKAGES_PATH=$INSTALLER_PATH/package
CONFIG_PATH=$INSTALLER_PATH/config/any
GDM_CONF=$(cat $CONFIG_PATH/gdm.conf)
GDM_TAP_TO_CLICK_CONF=$(cat $CONFIG_PATH/gdm-tap-to-click.conf)

for package in $(ls $PACKAGES_PATH); do
    source $PACKAGES_PATH/$package
done

init_scripts+=(
    'DISPLAY=:1 && xhost +SI:localuser:gdm'
    "echo '$GDM_CONF' | sudo tee /etc/gdm/custom.conf"
    "echo '$GDM_TAP_TO_CLICK_CONF' | sudo tee /etc/dconf/db/gdm.d/06-tap-to-click"
    "sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'"
)
