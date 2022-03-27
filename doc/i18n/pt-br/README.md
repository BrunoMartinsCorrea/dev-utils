# dev-utils

[en-us](../../../README.md)

Este repositório tem como objetivo criar alguns facilitadores para programadores, pricipalmente aqueles que como eu, amam trocar de distro semanalmente e precisam configurar seu ambiente o mais rápido possível!

## Como usar

Execute o _script_ principal (`dev-utils.sh`) e será apresentado um menu com as seguintes opções:

| Opção | Tarefa                               |       Padrão       |
| ----: | :----------------------------------- | :----------------: |
|     0 | Exit \[DEFAULT\]                     | :heavy_check_mark: |
|     1 | [Setup my computer](#computer-setup) |                    |
|     2 | [Config my git](#git-config)         |                    |
|     3 | [Config my OpenVPN](#openvpn-config) |                    |

---

## Computer setup

Cria um ambiente amplo para desenvolvimento baseado no seu perfil técnico, contendo as seguintes...

### Linguagens

-   [Clang](https://clang.llvm.org)
-   [Elixir](https://elixir-lang.org)
-   [Erlang](https://www.erlang.org)
-   [Go](https://golang.org)
-   [Groovy](https://groovy-lang.org)
-   [Haskell](https://www.haskell.org)
-   [Java](https://www.java.com)
-   [Kotlin](https://kotlinlang.org)
-   [Lisp](https://common-lisp.net)
-   [Lua](http://www.lua.org)
-   [NASM](https://www.nasm.us)
-   [Node.js](https://nodejs.org)
-   [Perl](https://www.perl.org)
-   [PHP](https://www.php.net)
-   [Python](https://www.python.org)
-   [R](https://www.r-project.org)
-   [Ruby](https://www.ruby-lang.org)
-   [Rust](https://www.rust-lang.org)
-   [Scala](https://www.scala-lang.org)
-   [Vala](https://wiki.gnome.org/Projects/Vala)

### Ferramentas / Frameworks

-   [Android Studio](https://developer.android.com/studio)
-   [Arduino IDE](https://www.arduino.cc/en/software)
-   [AWS CLI](https://aws.amazon.com/cli)
-   [Consul](https://www.consul.io)
-   [CPUFetch](https://github.com/Dr-Noob/cpufetch)
-   [ctop](https://github.com/bcicen/ctop)
-   [DBeaver](https://dbeaver.io)
-   [Discord](https://discord.com)
-   [Docker](https://www.docker.com)
-   [Element](https://matrix.org)
-   [Figma](https://www.figma.com/downloads)
-   [Flatpak](https://flatpak.org)
-   [Flutter](https://flutter.dev)
-   [Fritzing](https://fritzing.org)
-   [Google Chrome](https://www.google.com/chrome)
-   [htop](https://htop.dev)
-   [Insomnia](https://insomnia.rest)
-   [IntelliJ Community](https://www.jetbrains.com/idea/download)
-   [jq](https://stedolan.github.io/jq)
-   [Jupyter Notebook](https://jupyter.org)
-   [Kubernetes](https://kubernetes.io)
-   [LocalStack](https://github.com/localstack/localstack)
-   [Minikube](https://kubernetes.io)
-   [neofetch](https://github.com/dylanaraps/neofetch)
-   [Nomad](https://www.nomadproject.io)
-   [NVM](https://github.com/nvm-sh/nvm)
-   [Postman](https://www.postman.com)
-   [PyCharm Community](https://www.jetbrains.com/pycharm/download)
-   [React](https://reactjs.org)
-   [rustup](https://rustup.rs)
-   [SDKMAN](https://sdkman.io)
-   [Slack](https://slack.com)
-   [Spotify](https://www.spotify.com)
-   [Steam](https://store.steampowered.com)
-   [Teams](https://www.microsoft.com/pt-br/microsoft-teams/group-chat-software)
-   [Telegram](https://telegram.org)
-   [Terraform](https://www.terraform.io)
-   [Vagrant](https://www.vagrantup.com)
-   [Vault](https://www.vaultproject.io)
-   [Ventoy](https://www.ventoy.net)
-   [Visual Studio Code](https://code.visualstudio.com)
-   [VisualVM](https://visualvm.github.io)
-   [Vue.js](https://vuejs.org)
-   [Webex](https://www.webex.com)
-   [Whastapp](https://www.whatsapp.com)
-   [yq](https://github.com/mikefarah/yq)
-   [zsh](https://www.zsh.org)

## Git config

CLI simples usando o CLI oficial do GIT para facilitar as seguintes tarefas:

-   Configurar usuário global
-   Configurar diferentes usuários por pastas
-   Gerar diferentes chaves SSH por VCS (Version Control Software)
    -   [Bitbucket](https://bitbucket.org/)
    -   [GitHub](https://github.com/)
    -   [GitLab](https://gitlab.com/)

## OpenVPN config

Procura por arquivos .ovpn e importa o arqruivo selecionado ao NetworkManager configurando o nome do usuário, senha e um apelido para a conexão
