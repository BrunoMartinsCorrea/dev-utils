#!/bin/bash
cd /tmp/

sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y cmake tree vim curl net-tools xclip neofetch zsh zsh-syntax-highlighting zsh-autosuggestions libaio-dev ntfs-3g openjdk-8-jdk openjdk-11-jdk python3 python3-pip python3-notebook pipenv virtualenv clang erlang elixir golang nasm ruby perl clisp haskell-platform lua5.3 valabind valac valac-bin valadoc ninja-build meson pkg-config libgtk-3-dev arduino kubernetes php apktool android-sdk awscli git ssh zip unzip jq xmlstarlet htop qemu libvirt0 openvpn network-manager-openvpn-gnome openvpn-systemd-resolved fonts-powerline fonts-firacode fonts-noto-color-emoji docker-compose dconf-cli gnome-boxes gnome-tweak-tool gnome-sushi geary cheese gnome-audio gnome-builder gnome-calendar gnome-clocks gnome-contacts gnome-dictionary gnome-documents gnome-multi-writer gnome-photos gnome-remote-desktop gnome-shell-extension-gsconnect gnome-shell-extension-gsconnect-browsers gnome-sound-recorder gnome-todo gnome-weather peek pitivi gnome-music dconf-editor eog gnome-logs epiphany-browser gnome-books almanah seahorse gnome-system-monitor gnome-terminal tilix gnome-usage file-roller meld evince polari vinagre totem nautilus gparted chrome-gnome-shell gnome-shell-extension-appindicator gnome-shell-extension-caffeine gnome-shell-extension-arc-menu gnome-shell-extension-dash-to-panel gnome-shell-extension-draw-on-your-screen gnome-shell-extension-hard-disk-led gnome-shell-extension-system-monitor
sudo apt autoremove -y

# SNAP
sudo snap refresh
sudo snap install code --classic
sudo snap install intellij-idea-community --classic
sudo snap install pycharm-community --classic
sudo snap install flutter --classic
sudo snap install android-studio --classic
sudo snap install androidsdk teams beekeeper-studio telegram-desktop insomnia dbeaver-ce discord k9s spotify
# SNAP

# CTOP
sudo wget https://github.com/bcicen/ctop/releases/download/0.7.6/ctop-0.7.6-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop
# CTOP

# ORACLE
curl -LJ# \
    -o instantclient-basic-linux.zip https://download.oracle.com/otn_software/linux/instantclient/213000/instantclient-basic-linux.x64-21.3.0.0.0.zip \
    -o instantclient-sdk-linux.zip https://download.oracle.com/otn_software/linux/instantclient/213000/instantclient-sdk-linux.x64-21.3.0.0.0.zip

unzip instantclient-basic-linux.zip
unzip instantclient-sdk-linux.zip
cd instantclient_*
sudo cp *.so* /usr/lib
# ORACLE

# MINIKUBE
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
# MINIKUBE

# GOOGLE CHROME
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f
# GOOGLE CHROME

#KVM
sudo adduser $USER kvm
#KVM

# ARDUINO
sudo usermod -aG dialout $USER
# ARDUINO

#DOCKER
sudo usermod -aG docker $USER
#DOCKER

# RUSTUP
curl -fsS https://sh.rustup.rs | sh -s -- -y --profile complete -c rls
# RUSTUP

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
npm install -g yarn @nestjs/cli react-native-cli create-react-app create-next-app vercel @vue/cli vue-native-cli json-server expo-cli netlify-cli tsdx
# NPM

# ANDROID-SDK
if [ "$FRONTEND" == "1" ]; then
    mkdir -p ~/.android && touch ~/.android/repositories.cfg

    androidsdk --update

    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
    export ANDROID_HOME=$HOME/AndroidSDK
    export ANDROID_SDK_ROOT=$ANDROID_HOME
    export PATH=$PATH:$ANDROID_HOME/emulator
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/tools/bin
    export PATH=$PATH:$ANDROID_HOME/platform-tools

    sdkmanager --update
    yes | sdkmanager --install platform-tools emulator
    yes | sdkmanager --licenses

    SDKMANAGER_LIST=$(sdkmanager --list)
    SDKMANAGER_PLATFORMS=$(echo $SDKMANAGER_LIST | grep -Po "platforms;android-(\d{2,}|[a-zA-Z]*)" | sort -r | head -1)
    SDKMANAGER_BUILD_TOOLS=$(echo $SDKMANAGER_LIST | grep -Po "build-tools;(\d+\.){2}\d+(?=\s)" | sort -r | head -1)
    SDKMANAGER_SYSTEM_IMAGES=$(echo $SDKMANAGER_LIST | grep -Po "system-images;android\S*google_apis;x86_64" | sort -r | head -1)

    sdkmanager "$SDKMANAGER_PLATFORMS"
    sdkmanager "$SDKMANAGER_BUILD_TOOLS"
    sdkmanager "$SDKMANAGER_SYSTEM_IMAGES"
    avdmanager create avd --force --name pixel --device "pixel_xl" --package "$SDKMANAGER_SYSTEM_IMAGES"
fi
# ANDROID-SDK

# FLUTTER
flutter config --enable-linux-desktop
flutter doctor
# FLUTTER

# VSCODE
code --install-extension ms-vscode.cmake-tools --force
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
code --install-extension ms-devlabs.extension-manifest-editor --force
code --install-extension ms-vscode.github-issues-prs --force
code --install-extension ritwickdey.liveserver --force
code --install-extension ms-vsliveshare.vsliveshare --force
code --install-extension ms-vsliveshare.vsliveshare-audio --force
code --install-extension ms-vsliveshare.vsliveshare-pack --force
code --install-extension ms-python.python --force
code --install-extension ms-vscode-remote.remote-containers --force
code --install-extension ms-vscode-remote.remote-ssh --force
code --install-extension ms-vscode-remote.remote-ssh-edit --force
code --install-extension ms-vscode-remote.remote-wsl --force
code --install-extension rust-lang.rust --force
code --install-extension visualstudioexptteam.vscodeintellicode --force
code --install-extension ms-vscode.wordcount --force
code --install-extension vsciot-vscode.vscode-arduino --force
code --install-extension ms-vscode.cpptools --force
code --install-extension vscjava.vscode-java-debug --force
code --install-extension JakeBecker.elixir-ls --force
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension golang.go --force
code --install-extension ms-vscode.hexeditor --force
code --install-extension vscjava.vscode-java-pack --force
code --install-extension vscjava.vscode-java-test --force
code --install-extension ms-vscode.vscode-typescript-next --force
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools --force
code --install-extension redhat.java --force
code --install-extension vscjava.vscode-maven --force
code --install-extension asabil.meson --force
code --install-extension ms-ossdata.vscode-postgresql --force
code --install-extension vscjava.vscode-java-dependency --force
code --install-extension vscjava.vscode-spring-boot-dashboard --force
code --install-extension pivotal.vscode-spring-boot --force
code --install-extension vscjava.vscode-spring-initializr --force
code --install-extension ms-vscode.vscode-typescript-tslint-plugin --force
code --install-extension prince781.vala --force
code --install-extension mjmcloug.vscode-elixir --force
code --install-extension redhat.vscode-yaml --force
code --install-extension ms-kubernetes-tools.kind-vscode --force
code --install-extension msjsdiag.debugger-for-chrome --force
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension ms-vscode.vscode-typescript-next --force
code --install-extension msjsdiag.vscode-react-native --force
code --install-extension ms-vscode.vscode-typescript-tslint-plugin --force
code --install-extension ms-toolsai.jupyter --force
code --install-extension ms-ossdata.vscode-postgresql --force
# VSCODE

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
alias update-all-system-packages=\"sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo snap refresh\"
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

# ANDROID-SDK
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export ANDROID_HOME=\$HOME/AndroidSDK
export ANDROID_SDK_ROOT=\$ANDROID_HOME
export PATH=\$PATH:\$ANDROID_HOME/emulator
export PATH=\$PATH:\$ANDROID_HOME/tools
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
export PATH=\$PATH:\$ANDROID_HOME/platform-tools
" > ~/.zshrc
# ZSHELL
