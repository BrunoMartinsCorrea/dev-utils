#!/bin/bash

printf "Informe seu nome completo: "
read USER_NAME
printf "Informe seu e-mail completo: "
read USER_EMAIL

git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
ssh-keygen -t rsa -b 4096 -C "$USER_EMAIL"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
printf "\n\n======================================\nSua chave está na área de tranferência\n======================================\n"
