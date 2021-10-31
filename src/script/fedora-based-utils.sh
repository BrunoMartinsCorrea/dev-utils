#!/bin/bash

sudo dnf install -y python3 python3-pip clang erlang elixir golang nasm ruby perl clisp haskell-platform lua vala ninja-build meson kubernetes php NetworkManager-ssh-gnome qemu NetworkManager-openvpn-gnome jetbrains-mono-fonts-all powerline fira-code-fonts google-noto-emoji-color-fonts dconf dconf-editor gnome-boxes gnome-tweak-tool sushi geary cheese eog gnome-builder gnome-calendar gnome-clocks gnome-contacts gnome-dictionary gnome-multi-writer gnome-photos gnome-remote-desktop gnome-sound-recorder gnome-logs gnome-todo gnome-weather peek pitivi epiphany gnome-latex gnome-books gnome-connections almanah seahorse gnome-system-monitor gnome-terminal tilix gnome-usage file-roller meld evince polari vinagre totem gnome-music nautilus chrome-gnome-shell gnome-shell-extension-gsconnect gnome-shell-extension-appindicator gnome-shell-extension-common gnome-shell-extension-dash-to-dock

#KVM
sudo adduser $USER kvm
#KVM

# SDKMAN
curl -s "https://get.sdkman.io" | bash
SDKMAN_INIT_FILE="$HOME/.sdkman/bin/sdkman-init.sh"
if [ -f "$SDKMAN_INIT_FILE" ]; then
    source "$SDKMAN_INIT_FILE"
fi
sdk selfupdate force

sed -i '/auto_answer/s/false/true/' ~/.sdkman/etc/config
sed -i '/auto_selfupdate/s/false/true/' ~/.sdkman/etc/config
sed -i '/colour_enable/s/false/true/' ~/.sdkman/etc/config
sed -i '/auto_env/s/false/true/' ~/.sdkman/etc/config

sdk list java | grep -Po "(8|11|16)(\.\d+)+-zulu" | while read -r JAVA_LATEST_MINOR; do
    sdk install java $JAVA_LATEST_MINOR < /dev/null
done
sdk install kotlin < /dev/null
sdk install scala < /dev/null
sdk install groovy < /dev/null
sdk install maven < /dev/null
sdk install gradle < /dev/null
sdk install visualvm < /dev/null

echo "[Desktop Entry]
Name=VisualVM
Type=Application
Categories=Development;
Exec=$HOME/.sdkman/candidates/visualvm/current/bin/visualvm
Icon=$HOME/.sdkman/candidates/visualvm/current/etc/visualvm.icns
" > ~/.local/share/applications/visualvm-sdkman.desktop
# SDKMAN

# NVM
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts
# NVM

# NPM
npm install -g yarn @nestjs/cli react-native-cli create-react-app create-next-app vercel @vue/cli vue-native-cli json-server expo-cli netlify-cli
# NPM
