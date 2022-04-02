# dev-utils

[pt-BR](doc/i18n/pt-br/README.md)

This repository aims to create some facilitators for programmers, specially for those like me, who love distro hopping
weekly and need to configure the dev environment as quickly as possible!

## How to use

Execute the main script (`dev-utils.sh`) and it will show you a menu with the following options:

| Option | Task                                 |      Default       |
|-------:|:-------------------------------------|:------------------:|
|      0 | Exit \[DEFAULT\]                     | :heavy_check_mark: |
|      1 | [Setup my computer](#computer-setup) |                    |
|      2 | [Config my git](#git-config)         |                    |
|      3 | [Config my OpenVPN](#openvpn-config) |                    |

---

## Computer setup

Cria um ambiente amplo para desenvolvimento baseado no seu perfil técnico, contendo as seguintes...

### Programming Languages

- [Clang](https://clang.llvm.org)
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
- [Consul](https://www.consul.io)
- [CPUFetch](https://github.com/Dr-Noob/cpufetch)
- [ctop](https://github.com/bcicen/ctop)
- [DBeaver](https://dbeaver.io)
- [Discord](https://discord.com)
- [Docker](https://www.docker.com)
- [Element](https://matrix.org)
- [Figma](https://www.figma.com/downloads)
- [Flatpak](https://flatpak.org)
- [Flutter](https://flutter.dev)
- [Fritzing](https://fritzing.org)
- [Google Chrome](https://www.google.com/chrome)
- [htop](https://htop.dev)
- [Insomnia](https://insomnia.rest)
- [IntelliJ Community](https://www.jetbrains.com/idea/download)
- [jq](https://stedolan.github.io/jq)
- [Jupyter Notebook](https://jupyter.org)
- [Kubernetes](https://kubernetes.io)
- [LocalStack](https://github.com/localstack/localstack)
- [Minikube](https://kubernetes.io)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [Nomad](https://www.nomadproject.io)
- [NVM](https://github.com/nvm-sh/nvm)
- [Postman](https://www.postman.com)
- [PyCharm Community](https://www.jetbrains.com/pycharm/download)
- [React](https://reactjs.org)
- [rustup](https://rustup.rs)
- [SDKMAN](https://sdkman.io)
- [Slack](https://slack.com)
- [Spotify](https://www.spotify.com)
- [Steam](https://store.steampowered.com)
- [Teams](https://www.microsoft.com/pt-br/microsoft-teams/group-chat-software)
- [Telegram](https://telegram.org)
- [Terraform](https://www.terraform.io)
- [Vagrant](https://www.vagrantup.com)
- [Vault](https://www.vaultproject.io)
- [Ventoy](https://www.ventoy.net)
- [Visual Studio Code](https://code.visualstudio.com)
- [VisualVM](https://visualvm.github.io)
- [Vue.js](https://vuejs.org)
- [Webex](https://www.webex.com)
- [Whastapp](https://www.whatsapp.com)
- [yq](https://github.com/mikefarah/yq)
- [zsh](https://www.zsh.org)

---

## Git config

Simple CLI that uses official GIT CLI to facilitate the following tasks:

- Set up Global user
- Set up different users by folders
- Generate different SSH keys by VCS (Version Control Software)
    - [Bitbucket](https://bitbucket.org/)
    - [GitHub](https://github.com/)
    - [GitLab](https://gitlab.com/)

---

## OpenVPN config

Search and select an .ovpn file and import it into the NetworkManager setting your username, password and nickname for
the connection
