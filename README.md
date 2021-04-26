# dev-utils

[pt-BR](README-PT-BR.md)

This repository aims to create some facilitators for programmers, specially for those like me, who love distro hopping weekly and need to configure the dev environment as quickly as possible! 

## arch-based-config.sh

Creates a dev environment based on your technical profile (backend, frontend or data scientist), containing the following...

### Programming Languages

- [Elixir](https://elixir-lang.org)
- [Erlang](https://www.erlang.org)
- [Go](https://golang.org)
- [Groovy](https://groovy-lang.org)
- [Haskell](https://www.haskell.org)
- [Java](https://www.java.com)
- [Kotlin](https://kotlinlang.org)
- [Lisp](https://common-lisp.net)
- [Lua](http://www.lua.org)
- [NASM](https://www.nasm.us)
- [Node.js](https://nodejs.org)
- [Perl](https://www.perl.org)
- [PHP](https://www.php.net)
- [Python](https://www.python.org)
- [R](https://www.r-project.org)
- [Ruby](https://www.ruby-lang.org)
- [Rust](https://www.rust-lang.org)
- [Scala](https://www.scala-lang.org)
- [Vala](https://wiki.gnome.org/Projects/Vala)

### Tools / Frameworks

- [Android Studio](https://developer.android.com/studio)
- [Arduino IDE](https://www.arduino.cc/en/software)
- [AWS CLI](https://aws.amazon.com/cli)
- [Google Chrome](https://www.google.com/chrome)
- [DBeaver](https://dbeaver.io)
- [Discord](https://discord.com)
- [Docker](https://www.docker.com)
- [Element](https://matrix.org)
- [Flatpak](https://flatpak.org)
- [Insomnia](https://insomnia.rest)
- [IntelliJ Community](https://www.jetbrains.com/idea/download)
- [Jupyter Notebook](https://jupyter.org)
- [LocalStack](https://github.com/localstack/localstack)
- [Minikube](https://kubernetes.io)
- [NVM](https://github.com/nvm-sh/nvm)
- [PyCharm Community](https://www.jetbrains.com/pycharm/download)
- [React](https://reactjs.org)
- [SDKMAN](https://sdkman.io)
- [Slack](https://slack.com)
- [Spotify](https://www.spotify.com)
- [Steam](https://store.steampowered.com)
- [Telegram](https://telegram.org)
- [Ventoy](https://www.ventoy.net)
- [Visual Studio Code](https://code.visualstudio.com)
- [VisualVM](https://visualvm.github.io)
- [Vue.js](https://vuejs.org)

### How to Use

For more details on how to use it, check out the help option available in the script. 

```bash
./arch-based-dev-config.sh -h
```

PS: This script will override your .zshrc file, so if you want to create variables, aliases or even customize your oh-my-zsh theme, write these commands in the .zsh_profile file, this file is safe from changes.

## git-config.sh

Simple CLI that uses official GIT CLI to facilitate the following tasks:

- Set up Global user
- Set up different users by folders
- Generate different SSH keys by VCS (Version Control Software)
    - [Bitbucket](https://bitbucket.org/)
    - [GitHub](https://github.com/)
    - [GitLab](https://gitlab.com/)

## gnome-arch-based-mojave-theme-config.sh

Script that applies the Mojave theme to your Gnome 3 desktop environment.

### How to Use

For more details on how to use it, check out the help option available in the script. 

```bash
./gnome-arch-based-mojave-theme-config.sh -h
```

## vpn-config.sh

Search and select an .ovpn file and import it into the NetworkManager setting your username, password and nickname for the connection