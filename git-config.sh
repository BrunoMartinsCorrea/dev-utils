#!/bin/sh

# https://www.kevinkuszyk.com/2018/12/10/git-tips-6-using-git-with-multiple-email-addresses/
clear
printf "
╔═══════════════════════════════╗
║    Configuring the VCS SSH    ║
╠═══════════════════════════════╣
║        Press enter...         ║
╚═══════════════════════════════╝
"
read

GIT_NAME=$(git config --list | grep -Po "(?<=user.name=).*")
GIT_EMAIL=$(git config --list | grep -Po "(?<=user.email=).*")

while :
do
    if [ -z "$GIT_EMAIL" ]; then
        printf "Type your full name: "
        read USER_NAME

        printf "Type your e-mail: "
        read USER_EMAIL

        git config --global user.name "$USER_NAME"
        git config --global user.email "$USER_EMAIL"
        git config --global pull.rebase true
    fi

    printf "Select a service to configure?\nGithub(1) Bitbucket(2) Gitlab(3) Other(4) [1]: "
    read VCS_OPTION

    VCS_NAME=github
    VCS_SSH_URL="https://github.com/settings/keys"

    if [ -z "$VCS_OPTION" ] || [ "$VCS_OPTION" -eq "1" ]; then
        VCS_NAME=github
        VCS_SSH_URL="https://github.com/settings/keys"
    elif [ "$VCS_OPTION" -eq "2" ]; then
        VCS_NAME=bitbucket
        VCS_SSH_URL="https://bitbucket.org/account/settings/ssh-keys/"
    elif [ "$VCS_OPTION" -eq "3" ]; then
        VCS_NAME=gitlab
        VCS_SSH_URL="https://gitlab.com/profile/keys"
    else
        printf "Type the service name: "
        read VCS_OTHER_NAME
        
        VCS_NAME=$(echo "$VCS_OTHER_NAME" | awk '{print tolower($0)}')
    fi

    ssh-keygen -t rsa -b 4096 -C "$USER_EMAIL" -f ~/.ssh/id_rsa_$VCS_NAME -q -N ""
    ssh-add ~/.ssh/id_rsa_$VCS_NAME
    xclip -sel clip < ~/.ssh/id_rsa_$VCS_NAME.pub

    clear

    printf "
    ╔══════════════════════════════════════════════╗
    ║         Your SSH key is on clipboard         ║
    ╠══════════════════════════════════════════════╣
    ║   Press enter and paste the SSH key on the   ║
    ║ website that will open.                      ║
    ╚══════════════════════════════════════════════╝"
    read
    xdg-open $VCS_SSH_URL > /dev/null 2>&1

    printf "Do you want to configure another SSH key? [s/N]: "
    read CONTINUE_OPTION

    if [ "$CONTINUE_OPTION" != "s" ] && [ "$CONTINUE_OPTION" != "S" ]; then
        break
    fi
done
