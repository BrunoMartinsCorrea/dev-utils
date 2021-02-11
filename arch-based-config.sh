#!/bin/bash
sudo pacman -Syyu --needed --noconfirm base-devel rust

cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S --needed --noconfirm zsh xclip tree vim curl net-tools openvpn zip unzip git jq htop python python-pip erlang elixir npm nvm go nasm ruby clisp ghc cabal-install stack r julia php lua vala vala-lint-git ninja meson heroku-cli docker-compose ctop postgresql minikube kubectl helm k9s kind flatpak chromium intellij-idea-community-edition pycharm-community-edition android-studio visual-studio-code-bin postman-bin visualvm oh-my-zsh-git zsh-syntax-highlighting powerline-fonts ttf-jetbrains-mono ttf-ms-fonts ttf-wps-fonts telegram-desktop slack-desktop steam dbeaver android-tools android-sdk android-ndk android-emulator flutter

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

# VSCODE
code --install-extension vscoss.vscode-ansible
code --install-extension vsciot-vscode.vscode-arduino
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cmake-tools
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension vscjava.vscode-java-debug
code --install-extension ms-azuretools.vscode-docker
code --install-extension docsmsft.docs-article-templates
code --install-extension docsmsft.docs-images
code --install-extension docsmsft.docs-linting
code --install-extension docsmsft.docs-markdown
code --install-extension docsmsft.docs-metadata
code --install-extension docsmsft.docs-preview
code --install-extension docsmsft.docs-build
code --install-extension docsmsft.docs-yaml
code --install-extension editorconfig.editorconfig
code --install-extension JakeBecker.elixir-ls
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-devlabs.extension-manifest-editor
code --install-extension ms-vscode.github-browser
code --install-extension ms-vscode.github-issues-prs
code --install-extension golang.go
code --install-extension ms-vscode.hexeditor
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-java-test
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ms-toolsai.jupyter
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension redhat.java
code --install-extension ritwickdey.liveserver
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vsliveshare.vsliveshare-audio
code --install-extension ms-vsliveshare.vsliveshare-pack
code --install-extension vscjava.vscode-maven
code --install-extension asabil.meson
code --install-extension ms-ossdata.vscode-postgresql
code --install-extension vscjava.vscode-java-dependency
code --install-extension ms-python.python
code --install-extension msjsdiag.vscode-react-native
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension rust-lang.rust
code --install-extension vscjava.vscode-spring-boot-dashboard
code --install-extension pivotal.vscode-spring-boot
code --install-extension vscjava.vscode-spring-initializr
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension prince781.vala
code --install-extension visualstudioexptteam.vscodeintellicode
code --install-extension ms-vscode.wordcount
code --install-extension redhat.vscode-yaml
code --install-extension ms-kubernetes-tools.kind-vscode
# VSCODE
