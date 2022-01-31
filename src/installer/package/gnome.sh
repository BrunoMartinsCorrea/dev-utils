#!/bin/bash

GDM_CONF=$(cat $CONFIG_PATH/gdm.conf)
GDM_TAP_TO_CLICK_CONF=$(cat $CONFIG_PATH/gdm-tap-to-click.conf)

case "$OS_NAME" in
linux)
    init_scripts+=(
        #'DISPLAY=:1 && xhost +SI:localuser:gdm'
        "echo '$GDM_CONF' | sudo tee /etc/gdm/custom.conf"
        "echo '$GDM_TAP_TO_CLICK_CONF' | sudo tee /etc/dconf/db/gdm.d/06-tap-to-click"
        #"sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'"
    )
    end_scripts+=(
        'gsettings set org.gnome.shell app-picker-layout "[]"'
    )

    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'almanah'
            'cheese'
            'chrome-gnome-shell'
            'dconf-editor'
            'dconf'
            'eog'
            'epiphany'
            'evince'
            'file-roller'
            'geary'
            'gnome-books'
            'gnome-boxes'
            'gnome-builder'
            'gnome-calendar'
            'gnome-clocks'
            'gnome-connections'
            'gnome-contacts'
            'gnome-dictionary'
            'gnome-logs'
            'gnome-multi-writer'
            'gnome-music'
            'gnome-photos'
            'gnome-remote-desktop'
            'gnome-shell-extension-appindicator'
            'gnome-shell-extension-common'
            'gnome-shell-extension-dash-to-dock'
            'gnome-shell-extension-gsconnect'
            'gnome-sound-recorder'
            'gnome-system-monitor'
            'gnome-terminal'
            'gnome-todo'
            'gnome-tweak-tool'
            'gnome-usage'
            'gnome-weather'
            'meld'
            'nautilus'
            'NetworkManager-openvpn-gnome'
            'NetworkManager-ssh-gnome'
            'peek'
            'pitivi'
            'polari'
            'seahorse'
            'sushi'
            'tilix'
            'totem'
            'vinagre'
        )
        ;;
    esac
    ;;
esac
