#!/bin/bash

GDM_CONF=$(cat $CONFIG_PATH/gdm.conf)
GDM_TAP_TO_CLICK_CONF=$(cat $CONFIG_PATH/gdm-tap-to-click.conf)

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    fedora)
        official_packages+=(
            'dconf'
            'epiphany'
            'gnome-shell-extension-common'
            'gnome-shell-extension-dash-to-dock'
            'gnome-tweak-tool'
            'NetworkManager-fortisslvpn-gnome'
            'NetworkManager-openconnect-gnome'
            'NetworkManager-openvpn-gnome'
            'NetworkManager-ssh-gnome'
            'sushi'
        )
        ;;&
    ubuntu)
        official_packages+=(
            'dconf-cli'
            'epiphany-browser'
            'gnome-tweaks'
            'gnome-sushi'
            'network-manager-fortisslvpn-gnome'
            'network-manager-openconnect-gnome'
            'network-manager-openvpn-gnome'
            'network-manager-ssh-gnome'
        )
        ;;&
    fedora | ubuntu)
        init_scripts+=(
            #'DISPLAY=:1 && xhost +SI:localuser:gdm'
            'sudo mkdir -p /etc/gdm'
            'sudo mkdir -p /etc/dconf/db/gdm.d'
            "echo '$GDM_CONF' | sudo tee /etc/gdm/custom.conf"
            "echo '$GDM_TAP_TO_CLICK_CONF' | sudo tee /etc/dconf/db/gdm.d/06-tap-to-click"
            #"sudo -u gdm dbus-launch gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'"
        )
        end_scripts+=(
            'gsettings set org.gnome.desktop.interface enable-animations true'
            'gsettings set org.gnome.desktop.interface enable-hot-corners false'
            'gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"'
            'gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"'
            'gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true'
            'gsettings set org.gnome.desktop.peripherals.keyboard remember-numlock-state true'
            'gsettings set org.gnome.desktop.peripherals.touchpad click-methods "fingers"'
            'gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true'
            'gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true'
            'gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true'
            'gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true'
            'gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true'
            'gsettings set org.gnome.desktop.wm.keybindings show-desktop "[\"<Super>d\"]"'
            'gsettings set org.gnome.desktop.wm.keybindings switch-applications "[\"<Super>Tab\"]"'
            'gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "[\"<Shift><Super>Tab\", \"<Shift><Alt>Tab\"]"'
            'gsettings set org.gnome.desktop.wm.keybindings switch-windows "[\"<Alt>Tab\"]"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Files"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "nautilus"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Super>e"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "System Monitor"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "gnome-system-monitor"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Control><Shift>Escape"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "Terminal"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "kgx"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "<Control><Alt>t"'
            'gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[\"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/\", \"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/\", \"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/\"]"'
            'gsettings set org.gnome.shell app-picker-layout "[]"'
            'gsettings set org.gnome.shell enabled-extensions "[\"appindicatorsupport@rgcjonas.gmail.com\"]"'
            'gsettings set org.gnome.mutter center-new-windows true'
        )
        official_packages+=(
            'almanah'
            'cheese'
            'chrome-gnome-shell'
            'dconf-editor'
            'eog'
            'evince'
            'file-roller'
            'geary'
            'gnome-books'
            'gnome-boxes'
            'gnome-builder'
            'gnome-calendar'
            'gnome-clocks'
            'gnome-connections'
            'gnome-console'
            'gnome-contacts'
            'gnome-dictionary'
            'gnome-logs'
            'gnome-multi-writer'
            'gnome-music'
            'gnome-photos'
            'gnome-remote-desktop'
            'gnome-shell-extension-appindicator'
            'gnome-shell-extension-gsconnect'
            'gnome-sound-recorder'
            'gnome-system-monitor'
            'gnome-text-editor'
            'gnome-todo'
            'gnome-usage'
            'gnome-weather'
            'meld'
            'nautilus'
            'peek'
            'pitivi'
            'polari'
            'seahorse'
            'tilix'
            'totem'
            'vinagre'
        )
        ;;
    esac
    ;;
esac
