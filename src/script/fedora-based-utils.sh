#!/bin/bash

sudo dnf install -y clang erlang elixir golang nasm ruby perl clisp haskell-platform lua vala ninja-build meson kubernetes php NetworkManager-ssh-gnome qemu NetworkManager-openvpn-gnome jetbrains-mono-fonts-all powerline fira-code-fonts google-noto-emoji-color-fonts dconf dconf-editor gnome-boxes gnome-tweak-tool sushi geary cheese eog gnome-builder gnome-calendar gnome-clocks gnome-contacts gnome-dictionary gnome-multi-writer gnome-photos gnome-remote-desktop gnome-sound-recorder gnome-logs gnome-todo gnome-weather peek pitivi epiphany gnome-latex gnome-books gnome-connections almanah seahorse gnome-system-monitor gnome-terminal tilix gnome-usage file-roller meld evince polari vinagre totem gnome-music nautilus chrome-gnome-shell gnome-shell-extension-gsconnect gnome-shell-extension-appindicator gnome-shell-extension-common gnome-shell-extension-dash-to-dock

#KVM
sudo adduser $USER kvm
#KVM

# NVM
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts
# NVM

# NPM
npm install -g yarn @nestjs/cli react-native-cli create-react-app create-next-app vercel @vue/cli vue-native-cli json-server expo-cli netlify-cli
# NPM
