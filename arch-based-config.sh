#!/bin/bash
function isInstalled() {
    if ! command -v $1 &> /dev/null; then
        echo "0"
    else
        echo "1"
    fi
}

sudo pacman -Syyu --needed --noconfirm base-devel rust

if [ $(isInstalled paru) == 0 ]; then
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
fi

paru -S --needed --noconfirm flatpak chromium telegram-desktop slack-desktop steam

# FLATPAK
if [ $(isInstalled flatpak) == 1 ]; then
    flatpak install -y flathub com.wps.Office com.discordapp.Discord com.spotify.Client im.riot.Riot
fi
# FLATPAK