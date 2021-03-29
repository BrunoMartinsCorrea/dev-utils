#!/bin/bash
function isInstalled() {
    if ! command -v $1 &> /dev/null; then
        echo "0"
    else
        echo "1"
    fi
}

sudo pacman -Syyu --noconfirm base-devel cmake git rustup

# RUSTUP
if [ $(isInstalled rustup) == 1 ]; then
    rustup install stable
    rustup default stable
    rustup component add rls
fi
# RUSTUP

if [ $(isInstalled paru) == 0 ]; then
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
fi

paru -S --needed --noconfirm flatpak google-chrome element-desktop telegram-desktop slack-desktop steam

# FLATPAK
if [ $(isInstalled flatpak) == 1 ]; then
    flatpak install -y flathub com.spotify.Client
fi
# FLATPAK