#!/bin/sh

case "$os_name" in
    linux)
        case "$distro_name" in
            fedora)
                official_packages+=(
                    'zsh'
                    'zsh-syntax-highlighting'
                    'zsh-autosuggestions'
                )
                custom_install_scripts+=(
                    'curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- -y'
                )
                post_install_scripts+=(
                    'if [ "$SHELL" != "/usr/bin/zsh" ]; then
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
                    touch ~/.zsh_profile'

                    'echo ''# PATH
                    if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
                    then
                        export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
                    fi

                    export PATH="$PATH:$HOME/.local/bin"

                    # OH-MY-ZSH VARS
                    ZSH_CACHE_DIR=$HOME/.cache/zsh
                    ZSH_THEME="agnoster"
                    if [ `tput colors` != "256" ]; then
                        ZSH_THEME="dstufft"
                    fi
                    plugins=(autopep8 aws colored-man-pages command-not-found dotenv docker docker-compose man pep8 pip rust rustup sudo cabal cargo gem golang gradle jfrog kubectl minikube mvn scala sdk spring adb react-native npm nvm yarn)

                    # FUNCTIONS
                    kill-on-port() {
                        pid=\"\$(lsof -t -i:\$1)\"
                        if [ -n \"\$pid\" ]; then
                            kill -9 \$pid;
                        fi
                    }

                    # ALIASES
                    alias docker-stop-all="docker stop \$(docker ps -aq)"
                    alias docker-remove-all-containers="docker rm -f \$(docker ps -aq)"
                    alias docker-remove-all-images="docker rmi -f \$(docker images -q)"
                    alias docker-cleanup="docker-stop-all && docker-remove-all-containers && docker-remove-all-images"
                    alias update-all-repositories='"'"'cur_dir=$(pwd) && for i in $(find . -name ".git" 2>/dev/null | grep -Po ".*(?=/\.git)" | grep -v ".*/\..*"); do cd "$cur_dir/$i" && echo -e "\n\nUPDATING $i\n\n" && git pull || true; done && cd "$cur_dir"'"'"'
                    alias update-all-pip-packages="pip list --outdated --format=freeze | grep -v '"'"'^\-e'"'"' | cut -d = -f 1 | xargs -n1 pip install -U"
                    alias update-all-system-packages="sudo dnf clean all && sudo dnf distro-sync -y && sudo dnf autoremove -y && sudo flatpak update -y"
                    alias update-everything='"'"'_pwd=\$(pwd) && cd && update-all-system-packages && update-all-pip-packages && rustup update && update-all-repositories && sdk self-update && sdk update && nvm install --lts --reinstall-packages-from=default --latest-npm && npm update -g && cd "$_pwd"'"'"'

                    # OH-MY-ZSH SOURCE
                    if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
                        source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
                    fi
                    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
                    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

                    # ANDROID-SDK
                    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
                    export ANDROID_HOME=$HOME/AndroidSDK
                    export ANDROID_SDK_ROOT=$ANDROID_HOME
                    export PATH=$PATH:$ANDROID_HOME/emulator
                    export PATH=$PATH:$ANDROID_HOME/tools
                    export PATH=$PATH:$ANDROID_HOME/tools/bin
                    export PATH=$PATH:$ANDROID_HOME/platform-tools

                    # SDKMAN
                    # THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
                    export SDKMAN_DIR="$HOME/.sdkman"
                    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
                    '' | sudo tee /etc/zsh/zshenv'
                    
                    'sudo sed -i "s/SHELL=.*/SHELL=\/bin\/zsh/" /etc/default/useradd'
                    
                    'sudo sed -i "s/DSHELL=.*/DSHELL=\/bin\/zsh/" /etc/adduser.conf'
                    
                    'sudo sed -i "s/#EXTRA_GROUPS=.*/EXTRA_GROUPS=\"dialout cdrom floppy audio video plugdev users kvm docker\"/" /etc/adduser.conf'
                    
                    'sudo sed -i "s/#ADD_EXTRA_GROUPS=.*/ADD_EXTRA_GROUPS=1/" /etc/adduser.conf'
                )
                ;;
        esac
        ;;
esac
