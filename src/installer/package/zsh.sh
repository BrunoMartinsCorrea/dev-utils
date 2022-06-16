#!/bin/bash

case "$OS_NAME" in
linux)
    case "$DISTRO_NAME" in
    arch | fedora | ubuntu)
        official_packages+=(
            'zsh'
            'zsh-autosuggestions'
            'zsh-syntax-highlighting'
        )
        custom_install_scripts+=(
            'curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- -y'
        )
        end_scripts+=(
            'if [ "$SHELL" != "/usr/bin/zsh" ]; then'
            '    while : ; do'
            '        chsh -s $(which zsh)'
            '        [[ "$?" == "1" ]] || break'
            '    done'
            '    while : ; do'
            '        sudo chsh -s $(which zsh)'
            '        [[ "$?" == "1" ]] || break'
            '    done'
            'fi'
            'mkdir -p ~/.cache/zsh'
        )
        rc_scripts+=(
            '# OH-MY-ZSH VARS'
            'ZSH_CACHE_DIR=$HOME/.cache/zsh'
            'ZSH_THEME="agnoster"'
            'if [ `tput colors` != "256" ]; then'
            '    ZSH_THEME="dstufft"'
            'fi'
            'plugins=(autopep8 aws colored-man-pages command-not-found dotenv docker docker-compose man pep8 pip rust sudo cabal gem golang gradle jfrog kubectl minikube mvn scala sdk spring terraform adb react-native npm nvm yarn)'
            ''
            '# FUNCTIONS'
            'kill-on-port() {'
            '    pid="$(lsof -t -i:$1)"'
            '    if [ -n "$pid" ]; then'
            '        kill -9 $pid;'
            '    fi'
            '}'
            ''
            '# ALIASES'
            'alias docker-stop-all="docker stop \$(docker ps -aq)"'
            'alias docker-remove-all-containers="docker rm -f \$(docker ps -aq)"'
            'alias docker-remove-all-images="docker rmi -f \$(docker images -q)"'
            'alias docker-remove-all-volumes="docker volume prune -f"'
            'alias docker-remove-all-networks="docker network prune -f"'
            'alias docker-cleanup="docker-stop-all && docker-remove-all-containers && docker-remove-all-images && docker-remove-all-volumes && docker-remove-all-networks"'
            'alias update-all-repositories='"'"'cur_dir=$(pwd) && for i in $(find . -name ".git" 2>/dev/null | grep -Po ".*(?=/\.git)" | grep -v ".*/\..*"); do cd "$cur_dir/$i" && echo -e "\n\nUPDATING $i\n\n" && git pull || true; done && cd "$cur_dir"'"'"''
            'alias update-all-pip-packages="pip list --outdated --format=freeze | grep -v '"'"'^\-e'"'"' | cut -d = -f 1 | xargs -n1 pip install -U"'
            'alias update-all-system-packages="sudo dnf distro-sync -y && sudo dnf autoremove -y && sudo flatpak update -y"'
            'alias update-everything='"'"'_pwd=\$(pwd) && cd && update-all-system-packages && update-all-pip-packages && rustup update && update-all-repositories && sdk self-update && sdk update && nvm install --lts --reinstall-packages-from=default --latest-npm && npm update -g && cd "$_pwd"'"'"''
            ''
            '# OH-MY-ZSH SOURCE'
            'if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then'
            '    source "$HOME/.oh-my-zsh/oh-my-zsh.sh"'
            'fi'
            'source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
            'source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
            ''
            '# SDKMAN'
            '# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!'
            'export SDKMAN_DIR="$HOME/.sdkman"'
            '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"'
        )
        ;;
    esac
    ;;
esac
