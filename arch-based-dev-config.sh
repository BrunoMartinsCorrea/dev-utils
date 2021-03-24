#!/bin/bash
function isInstalled() {
    if ! command -v $1 &> /dev/null; then
        echo "0"
    else
        echo "1"
    fi
}

BACKEND=0
FRONTEND=0
DATA_SCIENCE=0

while [ -n "$1" ]; do
	case "$1" in
		--backend|-b)
			BACKEND=1;;
		--frontend|-f)
			FRONTEND=1;;
		--data-science|-d)
			DATA_SCIENCE=1;;
		--fullstack|-F)
			BACKEND=1
			FRONTEND=1;;
		--all|-A)
			BACKEND=1
			FRONTEND=1
			DATA_SCIENCE=1;;
		--help|-h|*)
			printf "Usage: $(basename $0) [OPTION..]

  By default, the following packages will be installed: [base-devel, rustup, python, docker, cmake, git, awscli, paru, zsh, oh-my-zsh, vscode, insomnia]

  -b, --backend         [llvm, nasm, erlang, elixir, go, ruby, perl, lisp, haskell, lua, vala, nvm, node, nest, sdkman, java, kotlin, scala, groovy, maven, gradle, visualvm, minikube, localstack, arduino-ide, intellij, pycharm, dbeaver]
  -f, --frontend        [php, nvm, node, react, react-native, vercel, vue, vue-native, json-server, expo-cli, netlify, jadx, android-studio]
  -d, --data-science    [pycharm, dbeaver, notebook]
  -F, --fullstack       All packages included in backend and frontend flags
  -A, --all             All packages above
"
			exit 0;;
	esac
	
	shift
done

sudo pacman -Syyu --noconfirm base-devel cmake git rustup

# RUSTUP
if [ $(isInstalled rustup) == 1 ]; then
    rustup install stable
    rustup default stable
    rustup component add rls
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

# DEFAULT
sudo pacman -S --needed --noconfirm zsh zsh-syntax-highlighting powerline-fonts ttf-jetbrains-mono ttf-fira-code ttf-nerd-fonts-symbols-mono man xclip tree vim curl net-tools openvpn zip unzip jq yq htop python python-pip docker-compose ctop qemu libvirt
# DEFAULT

# BACKEND
if [ "$BACKEND" == "1" ]; then
    sudo pacman -S --needed --noconfirm clang erlang elixir go nasm ruby perl clisp ghc cabal-install stack lua vala ninja meson arduino arduino-avr-core minikube kubectl helm k9s intellij-idea-community-edition pycharm-community-edition dbeaver
fi
# BACKEND

# FRONTEND
if [ "$FRONTEND" == "1" ]; then
    sudo pacman -S --needed --noconfirm php smali jadx jdk11-openjdk
fi
# FRONTEND

# DATA-SCIENCE
if [ "$DATA_SCIENCE" == "1" ]; then
    sudo pacman -S --needed --noconfirm r pycharm-community-edition dbeaver
fi
# DATA-SCIENCE

if [ $(isInstalled paru) == 1 ]; then
    # DEFAULT
    paru -Syyu --needed --noconfirm ttf-ms-fonts oh-my-zsh-git visual-studio-code-bin insomnia-bin
    # DEFAULT

    # BACKEND
    if [ "$BACKEND" == "1" ]; then
        paru -S --needed --noconfirm nvm kind ncurses5-compat-libs
    fi
    # BACKEND

    # FRONTEND
    if [ "$FRONTEND" == "1" ]; then
        paru -S --needed --noconfirm nvm android-studio
    fi
    # FRONTEND
fi

# KVM
sudo usermod -aG kvm $USER
# KVM

# DOCKER
if [ $(isInstalled docker) == 1 ]; then
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
fi
# DOCKER

# PYTHON
if [ $(isInstalled pip) == 1 ]; then
    # DEFAULT
    sudo pip install pipenv autopep8 pylint awscli boto3
    # DEFAULT

    # BACKEND
    if [ "$BACKEND" == "1" ]; then
        sudo pip install localstack-client
        pip install --user localstack
    fi
    # BACKEND

    # DATA-SCIENCE
    if [ "$DATA_SCIENCE" == "1" ]; then
        sudo pip install notebook
    fi
    # DATA-SCIENCE
fi
# PYTHON

# NVM
NVM_INIT_FILE="/usr/share/nvm/init-nvm.sh"
if [ -f "$NVM_INIT_FILE" ]; then
    source "$NVM_INIT_FILE"
fi

if [ $(isInstalled nvm) == 1 ]; then
    nvm install --lts
    nvm use --lts
fi
# NVM

# NPM
if [ $(isInstalled npm) == 1 ]; then
    # DEFAULT
    npm install -g yarn
    # DEFAULT

    # BACKEND
    if [ "$BACKEND" == "1" ]; then
        npm install -g @nestjs/cli
    fi
    # BACKEND

    # FRONTEND
    if [ "$FRONTEND" == "1" ]; then
        npm install -g react-native-cli create-react-app create-next-app vercel @vue/cli vue-native-cli json-server expo-cli netlify-cli
    fi
    # FRONTEND
fi
# NPM

# ARDUINO
if [ $(isInstalled arduino) == 1 ]; then
    sudo usermod -aG uucp $USER
fi
# ARDUINO

# SDKMAN
if [ "$BACKEND" == "1" ] && [ $(isInstalled zsh) == 1 ] && [ $(isInstalled sdk) == 0 ]; then
    curl -s "https://get.sdkman.io" | zsh
fi

SDKMAN_INIT_FILE="$HOME/.sdkman/bin/sdkman-init.sh"
if [ -f "$SDKMAN_INIT_FILE" ]; then
    source "$SDKMAN_INIT_FILE"
fi

if [ $(isInstalled sdk) == 1 ]; then
    sdk selfupdate force

    sed -i '/auto_answer/s/false/true/' ~/.sdkman/etc/config
    sed -i '/auto_selfupdate/s/false/true/' ~/.sdkman/etc/config
    sed -i '/colour_enable/s/false/true/' ~/.sdkman/etc/config
    sed -i '/auto_env/s/false/true/' ~/.sdkman/etc/config

    sdk list java | grep -Po "(8|11|15)(\.\d+)+-zulu" | while read -r JAVA_LATEST_MINOR; do
        sdk install java $JAVA_LATEST_MINOR < /dev/null
    done
    sdk install kotlin < /dev/null
    sdk install scala < /dev/null
    sdk install groovy < /dev/null
    sdk install maven < /dev/null
    sdk install gradle < /dev/null
    sdk install visualvm < /dev/null

    # VISUALVM
printf "[Desktop Entry]
Name=VisualVM
Type=Application
Categories=Development;
Exec=$HOME/.sdkman/candidates/visualvm/current/bin/visualvm
Icon=$HOME/.sdkman/candidates/visualvm/current/etc/visualvm.icns
" > ~/.local/share/applications/visualvm-sdkman.desktop
    # VISUALVM
fi
# SDKMAN

# VSCODE
if [ $(isInstalled code) == 1 ]; then
    # DEFAULT
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
    code --install-extension ms-vscode.github-browser --force
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
    # DEFAULT

    # BACKEND
    if [ "$BACKEND" == "1" ]; then
        code --install-extension vscoss.vscode-ansible --force
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
    fi
    # BACKEND

    # FRONTEND
    if [ "$FRONTEND" == "1" ]; then
        code --install-extension msjsdiag.debugger-for-chrome --force
        code --install-extension dbaeumer.vscode-eslint --force
        code --install-extension ms-vscode.vscode-typescript-next --force
        code --install-extension msjsdiag.vscode-react-native --force
        code --install-extension ms-vscode.vscode-typescript-tslint-plugin --force
    fi
    # FRONTEND

    # DATA-SCIENCE
    if [ "$DATA_SCIENCE" == "1" ]; then 
        code --install-extension ms-toolsai.jupyter --force
        code --install-extension ms-ossdata.vscode-postgresql --force
    fi
    # DATA-SCIENCE
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
    
    # DEFAULT
    printf "# OH-MY-ZSH VARS
ZSH_CACHE_DIR=~/.cache/zsh
ZSH_THEME=\"agnoster\"
if [ \`tput colors\` != \"256\" ]; then
  ZSH_THEME=\"dstufft\"
fi
plugins=(autopep8 aws colored-man-pages command-not-found dotenv docker docker-compose man pep8 pip rust rustup sudo " > ~/.zshrc

    # BACKEND
    if [ "$BACKEND" == "1" ]; then
        printf "cabal cargo gem golang gradle jfrog kubectl minikube mvn scala sdk spring " >> ~/.zshrc
    fi
    # BACKEND

    # FRONTEND
    if [ "$FRONTEND" == "1" ]; then
        printf "adb django react-native " >> ~/.zshrc
    fi
    # FRONTEND

    # BACKEND || FRONTEND
    if [ "$BACKEND" == "1" ] || [ "$FRONTEND" == "1" ]; then
        printf "npm nvm yarn" >> ~/.zshrc
    fi
    # BACKEND || FRONTEND

    printf ")

# PYTHON VARS
PIPENV_VENV_IN_PROJECT=true

# ALIASES
alias docker-stop-all=\"docker stop \\\$(docker ps -aq)\"
alias docker-remove-all-containers=\"docker rm -f \\\$(docker ps -aq)\"
alias docker-remove-all-images=\"docker rmi -f \\\$(docker images -q)\"
alias docker-cleanup=\"docker-stop-all && docker-remove-all-containers && docker-remove-all-images\"
alias update-all-repositories='cur_dir=\$(pwd) && for i in \$(find . -name \".git\" | grep -Po \".*(?=/\.git)\"); do cd \"\$cur_dir/\$i\" && printf \"\\\n\\\nUPDATING \$i\\\n\\\n\" && git fetch && git pull; done && cd \"\$cur_dir\"'

# USER PROFILE SOURCE
# ADD YOUR CUSTOM VARIABLES, ALIAS AND THEMES IN THE FILE BELOW
source \"\$HOME/.zsh_profile\"

# OH-MY-ZSH SOURCE
source /usr/share/oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
" >> ~/.zshrc
    # DEFAULT

    # NVM
    if [ $(isInstalled nvm) == 1 ]; then
        printf "
# NVM SOURCE
source /usr/share/nvm/init-nvm.sh
" >> ~/.zshrc
    fi
    # NVM

    # SDKMAN
    if [ $(isInstalled sdk) == 1 ]; then
        printf "
# SDKMAN
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR=\"\$HOME/.sdkman\"
[[ -s \"\$HOME/.sdkman/bin/sdkman-init.sh\" ]] && source \"\$HOME/.sdkman/bin/sdkman-init.sh\"
" >> ~/.zshrc
    fi
    # SDKMAN

    sudo cp ~/.zshrc /root/
    sudo touch ~/.zsh_profile
fi
# ZSHELL
