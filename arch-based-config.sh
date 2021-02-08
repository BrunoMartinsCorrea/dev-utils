#!/bin/bash
sudo pacman -Syyu --needed --noconfirm base-devel rustup

# RUSTUP
rustup install stable
rustup default stable
# RUSTUP

cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
sudo makepkg -si

paru -S --needed --noconfirm zsh ssed xclip xdotool tree vim curl net-tools openvpn zip unzip git jq tldr htop browsh-bin arandr ranger i3 python python-pip elixir vala vala-lint-git ninja meson lua npm nvm go docker-compose ctop postgresql nginx jenkins terraform chef-dk minikube kubectl helm lens-bin k9s stern-bin elasticsearch logstash kibana grafana prometheus pinpoint kafka redis flatpak google-chrome intellij-idea-community-edition pycharm-community-edition android-studio visual-studio-code-bin postman-bin insomnia visualvm oh-my-zsh-git zsh-syntax-highlighting powerline-fonts ttf-jetbrains-mono ttf-ms-fonts ttf-wps-fonts telegram-desktop slack-desktop steam dbeaver android-tools android-sdk android-ndk android-emulator flutter

# FLATPAK
flatpak install -y flathub com.wps.Office com.discordapp.Discord com.spotify.Client
# FLATPAK

# ZSHELL
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
touch ~/.zshrc
mkdir -p ~/.cache/zsh
printf "
export ZSH=/usr/share/oh-my-zsh

# ZSH
ZSH_CACHE_DIR=~/.cache/zsh
ZSH_THEME=\"agnoster\"

plugins=(adb autopep8 aws cargo colored-man-pages command-not-found django docker-compose docker flutter git golang gradle heroku jfrog kubectl man minikube node npm npx pep8 pip redis-cli rust rustup scala sdk spring sudo terraform themes yarn)

source \$ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/nvm/init-nvm.sh

# PYTHON
PIPENV_VENV_IN_PROJECT=true

# FLUTTER
export ANDROID_HOME=/opt/android-sdk
 
#ALIASES
alias ll=\"ls -la\"
alias docker-stop-all=\"sudo docker stop \\\$(sudo docker ps -aq)\"
alias docker-remove-all-containers=\"sudo docker rm \\\$(sudo docker ps -aq)\"
alias docker-remove-all-images=\"sudo docker rmi \\\$(sudo docker images -q)\"
alias docker-cleanup=\"docker-stop-all && docker-remove-all-containers && docker-remove-all-images\"
alias update-all-repositories='cur_dir=\$(pwd) && for i in \$(find . -name \".git\" | grep -Po \".*(?=/\.git)\"); do cd \"\$cur_dir/\$i\" && printf \"\\\n\\\nATUALIZANDO \$i\\\n\\\n\" && git fetch && git pull; done && cd \"\$cur_dir\"'\n
" >> ~/.zshrc
sudo cp ~/.zshrc /root/
# ZSHELL

# DOCKER
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
# DOCKER

# PYTHON
sudo pip install pipenv autopep8 pylint pgcli awscli boto3
pip install --user localstack
# PYTHON

# NVM
source /usr/share/nvm/init-nvm.sh
nvm install node
# NVM

# NPM
sudo npm install -g yarn react-native-cli create-react-app create-next-app @nestjs/cli @vue/cli json-server
# NPM

# SDKMAN
curl -s "https://get.sdkman.io" | zsh
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk list java | grep -Po "(8|11|15)(\.\d+)+-zulu" | while read -r JAVA_LATEST_MINOR; do
    sdk install java $JAVA_LATEST_MINOR < /dev/null
done
sdk install kotlin
sdk install scala
sdk install groovy
sdk install maven
sdk install gradle
sdk install springboot
sdk install spark
# SDKMAN

# FLUTTER
export ANDROID_HOME=/opt/android-sdk
sudo chown -R $USER /opt/flutter
flutter config --android-sdk $ANDROID_HOME
# FLUTTER

# KAFKA
# sudo systemctl enable zookeeper.service
# sudo systemctl start zookeeper.service
# sudo kafka-server-start.sh /etc/kafka/server.properties &
# KAFKA
