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
fi
# RUSTUP

# PARU
if [ $(isInstalled paru) == 0 ]; then
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
fi
# PARU

sudo pacman -S --needed --noconfirm zsh zsh-syntax-highlighting oh-my-zsh powerline-fonts ttf-jetbrains-mono clang man xclip tree vim curl net-tools openvpn zip unzip jq yq htop python python-pip r erlang elixir go nasm ruby perl clisp ghc cabal-install stack php lua vala ninja meson arduino arduino-avr-core docker-compose ctop minikube kubectl helm k9s smali jadx android-tools intellij-idea-community-edition pycharm-community-edition dbeaver

if [ $(isInstalled paru) == 1 ]; then
    paru -Syyu --needed --noconfirm nvm kind android-studio visual-studio-code-bin postman-bin ttf-ms-fonts ttf-wps-fonts ncurses5-compat-libs
fi

# DOCKER
if [ $(isInstalled docker) == 1 ]; then
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
fi
# DOCKER

# PYTHON
if [ $(isInstalled pip) == 1 ]; then
    sudo pip install pipenv autopep8 pylint notebook awscli boto3
    pip install --user localstack
fi
# PYTHON

# NVM
source /usr/share/nvm/init-nvm.sh
if [ $(isInstalled nvm) == 1 ]; then
    nvm install --lts
    nvm use --lts
fi
# NVM

# NPM
if [ $(isInstalled npm) == 1 ]; then
    npm install -g yarn react-native-cli create-react-app create-next-app @nestjs/cli @vue/cli vue-native-cli json-server expo-cli
fi
# NPM

# ARDUINO
sudo usermod -aG uucp $USER
# ARDUINO

# SDKMAN
if [ $(isInstalled zsh) == 1 ] && [ $(isInstalled sdk) == 0 ]; then
    curl -s "https://get.sdkman.io" | zsh
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
if [ $(isInstalled sdk) == 1 ]; then
    sdk selfupdate force
    sdk list java | grep -Po "(8|11|15)(\.\d+)+-zulu" | while read -r JAVA_LATEST_MINOR; do
        sdk install java $JAVA_LATEST_MINOR < /dev/null
    done
    sdk install kotlin < /dev/null
    sdk install scala < /dev/null
    sdk install groovy < /dev/null
    sdk install maven < /dev/null
    sdk install gradle < /dev/null
    sdk install visualvm < /dev/null
fi
# SDKMAN

# VISUALVM
printf "[Desktop Entry]
Name=VisualVM
Type=Application
Categories=Development;
Exec=$HOME/.sdkman/candidates/visualvm/current/bin/visualvm
Icon=$HOME/.sdkman/candidates/visualvm/current/etc/visualvm.icns
" > ~/.local/share/applications/visualvm-sdkman.desktop
# VISUALVM

# VSCODE
if [ $(isInstalled code) == 1 ]; then
    code --install-extension vscoss.vscode-ansible --force
    code --install-extension vsciot-vscode.vscode-arduino --force
    code --install-extension ms-vscode.cpptools --force
    code --install-extension ms-vscode.cmake-tools --force
    code --install-extension msjsdiag.debugger-for-chrome --force
    code --install-extension vscjava.vscode-java-debug --force
    code --install-extension ms-azuretools.vscode-docker --force
    code --install-extension docsmsft.docs-article-templates --force
    code --install-extension docsmsft.docs-images --force
    code --install-extension docsmsft.docs-linting --force
    code --install-extension docsmsft.docs-markdown --force
    code --install-extension docsmsft.docs-metadata --force
    code --install-extension docsmsft.docs-preview --force
    code --install-extension docsmsft.docs-build --force
    code --install-extension docsmsft.docs-yaml --force
    code --install-extension editorconfig.editorconfig --force
    code --install-extension JakeBecker.elixir-ls --force
    code --install-extension dbaeumer.vscode-eslint --force
    code --install-extension ms-devlabs.extension-manifest-editor --force
    code --install-extension ms-vscode.github-browser --force
    code --install-extension ms-vscode.github-issues-prs --force
    code --install-extension golang.go --force
    code --install-extension ms-vscode.hexeditor --force
    code --install-extension vscjava.vscode-java-pack --force
    code --install-extension vscjava.vscode-java-test --force
    code --install-extension ms-vscode.vscode-typescript-next --force
    code --install-extension ms-toolsai.jupyter --force
    code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools --force
    code --install-extension redhat.java --force
    code --install-extension ritwickdey.liveserver --force
    code --install-extension ms-vsliveshare.vsliveshare --force
    code --install-extension ms-vsliveshare.vsliveshare-audio --force
    code --install-extension ms-vsliveshare.vsliveshare-pack --force
    code --install-extension vscjava.vscode-maven --force
    code --install-extension asabil.meson --force
    code --install-extension ms-ossdata.vscode-postgresql --force
    code --install-extension vscjava.vscode-java-dependency --force
    code --install-extension ms-python.python --force
    code --install-extension msjsdiag.vscode-react-native --force
    code --install-extension ms-vscode-remote.remote-containers --force
    code --install-extension ms-vscode-remote.remote-ssh --force
    code --install-extension ms-vscode-remote.remote-ssh-edit --force
    code --install-extension ms-vscode-remote.remote-wsl --force
    code --install-extension rust-lang.rust --force
    code --install-extension vscjava.vscode-spring-boot-dashboard --force
    code --install-extension pivotal.vscode-spring-boot --force
    code --install-extension vscjava.vscode-spring-initializr --force
    code --install-extension ms-vscode.vscode-typescript-tslint-plugin --force
    code --install-extension prince781.vala --force
    code --install-extension visualstudioexptteam.vscodeintellicode --force
    code --install-extension ms-vscode.wordcount --force
    code --install-extension redhat.vscode-yaml --force
    code --install-extension ms-kubernetes-tools.kind-vscode --force
fi
# VSCODE

# ZSHELL
if [ $(isInstalled zsh) == 1 ]; then
    while : ; do
        chsh -s $(which zsh)
        [[ "$?" == "1" ]] || break
    done
    while : ; do
        sudo chsh -s $(which zsh)
        [[ "$?" == "1" ]] || break
    done
    mkdir -p ~/.cache/zsh
    touch ~/.zsh_profile
    printf "# OH-MY-ZSH VARS
ZSH_CACHE_DIR=~/.cache/zsh
ZSH_THEME=\"agnoster\"
if [ \`tput colors\` != \"256\" ]; then
  ZSH_THEME=\"dstufft\"
fi
plugins=(adb autopep8 aws cabal cargo colored-man-pages command-not-found django docker docker-compose dotenv flutter gem golang gradle heroku jfrog kubectl man minikube mvn npm nvm pep8 pip react-native redis-cli rust rustup scala sdk spring sudo yarn)

# PYTHON VARS
PIPENV_VENV_IN_PROJECT=true

# ALIASES
alias ll=\"ls -la\"
alias docker-stop-all=\"docker stop \\\$(docker ps -aq)\"
alias docker-remove-all-containers=\"docker rm \\\$(docker ps -aq)\"
alias docker-remove-all-images=\"docker rmi \\\$(docker images -q)\"
alias docker-cleanup=\"docker-stop-all && docker-remove-all-containers && docker-remove-all-images\"
alias update-all-repositories='cur_dir=\$(pwd) && for i in \$(find . -name \".git\" | grep -Po \".*(?=/\.git)\"); do cd \"\$cur_dir/\$i\" && printf \"\\\n\\\nATUALIZANDO \$i\\\n\\\n\" && git fetch && git pull; done && cd \"\$cur_dir\"'\n

# USER PROFILE SOURCE
# ADD YOUR CUSTOM VARIABLES, ALIAS AND THEMES IN THE FILE BELOW
source \"\$HOME/.zsh_profile\"

# OH-MY-ZSH SOURCE
source /usr/share/oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NVM SOURCE
source /usr/share/nvm/init-nvm.sh

# SDKMAN
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=\"\$HOME/.sdkman\"
[[ -s \"\$HOME/.sdkman/bin/sdkman-init.sh\" ]] && source \"\$HOME/.sdkman/bin/sdkman-init.sh\"
" > ~/.zshrc
    sudo cp ~/.zshrc /root/
    sudo touch ~/.zsh_profile
fi
# ZSHELL
