#!/bin/bash
GIT_PATH=$(which git)
XCLIP_PATH=$(which xclip)

if ! command -v git &> /dev/null || ! command -v xclip &> /dev/null; then
    printf "Oops! You need to install git and xclip before running this script!"
    exit 1
fi

while :
do
    clear
    printf "
╔══════════════════════════════════════╗
║        Welcome to git-config         ║
╠══════════════════════════════════════╣
║ 0. Exit [DEFAULT]                    ║
║ 1. Configure global user             ║
║ 2. Configure user in a custom folder ║
║ 3. Generate SSH                      ║
╚══════════════════════════════════════╝

Option: "
    read MENU_OPTION

    if [ "$MENU_OPTION" == "1" ]; then
        GIT_NAME=$(git config --global user.name)
        GIT_EMAIL=$(git config --global user.email)
        GIT_OVERWRITE=1

        if [ -n "$GIT_NAME" ] || [ -n "$GIT_EMAIL" ]; then
            clear
            printf "
╔══════════════════════════════════════════╗
║                 WARNING                  ║
╠══════════════════════════════════════════╣
║ You have already set up your global user ║
╚══════════════════════════════════════════╝
User name : $GIT_NAME
User email: $GIT_EMAIL

Do you want to overwrite it? [y/N]: "
            read GIT_OVERWRITE_INPUT

            if [ "$GIT_OVERWRITE_INPUT" == "y" ] || [ "$GIT_OVERWRITE_INPUT" == "Y" ]; then
                GIT_OVERWRITE=1
            else
                GIT_OVERWRITE=0
            fi
        fi

        if [ "$GIT_OVERWRITE" == "1" ]; then
            clear
            printf "
╔════════════════════════════════════╗
║ You're setting up your global user ║
╚════════════════════════════════════╝
"
            printf "Type your full name: "
            read GIT_NAME

            printf "Type your e-mail: "
            read GIT_EMAIL

            git config --global user.name "$GIT_NAME"
            git config --global user.email "$GIT_EMAIL"
            git config --global pull.rebase true
        fi
    elif [ "$MENU_OPTION" == "2" ]; then
        DIRECTORY=~/

        while :
        do
        clear
            printf "Please select a directory:\n"
            select DIRECTORY in "$DIRECTORY"*/;
            do
                test -n "$DIRECTORY" && break
            done

            printf "Do you want to select another directory inside $DIRECTORY [Y/n]?: "
            read INSIDE_DIRECTORY
            if [ "$INSIDE_DIRECTORY" == "n" ] || [ "$INSIDE_DIRECTORY" == "N" ]; then

                break
            fi
        done

        GIT_NAME=$(git config --file $DIRECTORY/.gitconfig user.name)
        GIT_EMAIL=$(git config --file $DIRECTORY/.gitconfig user.email)
        GIT_OVERWRITE=1

        if [ -n "$GIT_NAME" ] || [ -n "$GIT_EMAIL" ]; then
            clear
            printf "
╔════════════════════════════════════════╗
║                 WARNING                ║
╠════════════════════════════════════════╣
║ You have already set up this directory ║
╚════════════════════════════════════════╝
User name : $GIT_NAME
User email: $GIT_EMAIL

Do you want to overwrite it? [y/N]: "
            read GIT_OVERWRITE_INPUT

            if [ "$GIT_OVERWRITE_INPUT" == "y" ] || [ "$GIT_OVERWRITE_INPUT" == "Y" ]; then
                GIT_OVERWRITE=1
            else
                GIT_OVERWRITE=0
            fi
        fi

        if [ "$GIT_OVERWRITE" == "1" ]; then
            clear
            printf "
╔══════════════════════════════════════╗
║ You're setting up your local user at ║
  $DIRECTORY
╚══════════════════════════════════════╝
"
            printf "Type your full name: "
            read GIT_NAME

            printf "Type your e-mail: "
            read GIT_EMAIL

            git config --file $DIRECTORY/.gitconfig user.name "$GIT_NAME"
            git config --file $DIRECTORY/.gitconfig user.email "$GIT_EMAIL"
            git config --file $DIRECTORY/.gitconfig pull.rebase true
            git config --global --add includeif.gitdir:$DIRECTORY.path $DIRECTORY.gitconfig
            clear
            printf "
╔════════════════════════════════════╗
║    User configured successfully!   ║
╠════════════════════════════════════╣
║    Press any key to continue...    ║
╚════════════════════════════════════╝"
            read
        fi
    elif [ "$MENU_OPTION" == "3" ]; then
        while :
        do
            clear
            printf "
╔══════════════════════════════════════╗
║     Select a product to configure    ║
╠══════════════════════════════════════╣
║ 0. Cancel                            ║
║ 1. Github [DEFAULT]                  ║
║ 2. Bitbucket                         ║
║ 3. Gitlab                            ║
║ 4. Other                             ║
╚══════════════════════════════════════╝

Option: "
            read VCS_OPTION

            VCS_NAME=github
            VCS_SSH_URL="https://github.com/settings/keys"

            if [ "$VCS_OPTION" == "0" ]; then
                break
            elif [ -z "$VCS_OPTION" ] || [ "$VCS_OPTION" == "1" ]; then
                VCS_NAME=github
                VCS_SSH_URL="https://github.com/settings/keys"
            elif [ "$VCS_OPTION" == "2" ]; then
                VCS_NAME=bitbucket
                VCS_SSH_URL="https://bitbucket.org/account/settings/ssh-keys/"
            elif [ "$VCS_OPTION" == "3" ]; then
                VCS_NAME=gitlab
                VCS_SSH_URL="https://gitlab.com/profile/keys"
            else
                printf "Type the service name: "
                read VCS_OTHER_NAME
                
                VCS_NAME=$(echo "$VCS_OTHER_NAME" | awk '{print tolower($0)}')
            fi

            ssh-keygen -t rsa -b 4096 -C "$GIT_EMAIL" -f ~/.ssh/id_rsa_$VCS_NAME -q -N ""
            ssh-add ~/.ssh/id_rsa_$VCS_NAME
            xclip -sel clip < ~/.ssh/id_rsa_$VCS_NAME.pub

            clear

            printf "
╔══════════════════════════════════════════════╗
║         Your SSH key is on clipboard         ║
╠══════════════════════════════════════════════╣
║   Press Enter and paste the SSH key on the   ║
║ website that will open.                      ║
╚══════════════════════════════════════════════╝"
            read
            xdg-open $VCS_SSH_URL > /dev/null 2>&1
            
            clear
            printf "Do you want to configure another SSH key? [y/N]: "
            read CONTINUE_OPTION

            if [ "$CONTINUE_OPTION" != "y" ] && [ "$CONTINUE_OPTION" != "Y" ]; then
                break
            fi
        done
    else
        break
    fi
done
