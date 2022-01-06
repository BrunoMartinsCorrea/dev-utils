#!/bin/bash

case "$OS_NAME" in
linux)
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
