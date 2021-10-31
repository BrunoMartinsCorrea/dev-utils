#!/bin/bash

sudo dnf install -y cmake tree vim curl net-tools xclip zsh zsh-syntax-highlighting zsh-autosuggestions python3 python3-pip clang erlang elixir golang nasm ruby perl clisp haskell-platform lua vala ninja-build meson arduino kubernetes php git openssh NetworkManager-ssh-gnome xclip zip unzip jq htop qemu libvirt-libs openvpn NetworkManager-openvpn-gnome jetbrains-mono-fonts-all powerline fira-code-fonts google-noto-emoji-color-fonts docker-distribution docker-compose ntfs-3g ntfs2btrfs ntfsprogs dconf dconf-editor gnome-boxes gnome-tweak-tool sushi geary cheese eog gnome-builder gnome-calendar gnome-clocks gnome-contacts gnome-dictionary gnome-multi-writer gnome-photos gnome-remote-desktop gnome-sound-recorder gnome-logs gnome-todo gnome-weather peek pitivi epiphany gnome-latex gnome-books gnome-connections almanah seahorse gnome-system-monitor gnome-terminal tilix gnome-usage file-roller meld evince polari vinagre totem gnome-music nautilus chrome-gnome-shell gnome-shell-extension-gsconnect gnome-shell-extension-appindicator gnome-shell-extension-common gnome-shell-extension-dash-to-dock

#KVM
sudo adduser $USER kvm
#KVM

# OHMYZSH
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- -y
# OHMYZSH

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

# ZSHELL
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    while : ; do
        chsh -s $(which zsh)
        [[ "$?" == "1" ]] || break
    done
    while : ; do
        sudo chsh -s $(which zsh)
        [[ "$?" == "1" ]] || break
    done
fi
mkdir -p ~/.cache/zsh
touch ~/.zsh_profile

echo "# OH-MY-ZSH VARS
ZSH_CACHE_DIR=~/.cache/zsh
ZSH_THEME=\"agnoster\"
if [ \`tput colors\` != \"256\" ]; then
  ZSH_THEME=\"dstufft\"
fi
plugins=(autopep8 aws colored-man-pages command-not-found dotenv docker docker-compose man pep8 pip rust rustup sudo cabal cargo gem golang gradle jfrog kubectl minikube mvn scala sdk spring adb django react-native npm nvm yarn )

# PYTHON VARS
PIPENV_VENV_IN_PROJECT=true

# FUNCTIONS
kill-on-port() {
    pid=\"\$(lsof -t -i:\$1)\"
    if [ -n \"\$pid\" ]; then
        kill -9 \$pid;
    fi
}

# ALIASES
alias docker-stop-all=\"docker stop \\\$(docker ps -aq)\"
alias docker-remove-all-containers=\"docker rm -f \\\$(docker ps -aq)\"
alias docker-remove-all-images=\"docker rmi -f \\\$(docker images -q)\"
alias docker-cleanup=\"docker-stop-all && docker-remove-all-containers && docker-remove-all-images\"
alias update-all-repositories='cur_dir=\$(pwd) && for i in \$(find . -name \".git\" 2>/dev/null | grep -Po \".*(?=/\.git)\" | grep -v \".*/\..*\"); do cd \"\$cur_dir/\$i\" && echo -e \"\\\n\\\nUPDATING \$i\\\n\\\n\" && git pull || true; done && cd \"\$cur_dir\"'
alias update-all-pip-packages=\"pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U\"
alias update-all-system-packages=\"sudo yum distro-sync -y && sudo yum autoremove -y && sudo flatpak update -y\"
alias update-everything='_pwd=\$(pwd) && cd && update-all-system-packages && update-all-pip-packages && rustup update && update-all-repositories && sdk self-update && sdk update && nvm install --lts --reinstall-packages-from=default --latest-npm && npm update -g && cd \"\$_pwd\"'

# USER PROFILE SOURCE
# ADD YOUR CUSTOM VARIABLES, ALIAS AND THEMES IN THE FILE BELOW
source \"\$HOME/.zsh_profile\"

# OH-MY-ZSH SOURCE
source \"\$HOME/.oh-my-zsh/oh-my-zsh.sh\"
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NVM SOURCE
source \"\$HOME/.nvm/nvm.sh\"
# SDKMAN
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=\"\$HOME/.sdkman\"
[[ -s \"\$HOME/.sdkman/bin/sdkman-init.sh\" ]] && source \"\$HOME/.sdkman/bin/sdkman-init.sh\"
" > ~/.zshrc
# ZSHELL
