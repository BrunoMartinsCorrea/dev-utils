# dev-utils

[en-us](README.md)

Este repositório tem como objetivo criar alguns facilitadores para programadores, pricipalmente aqueles que como eu, amam trocar de distro semanalmente e precisam configurar seu ambiente o mais rápido possível!

## arch-based-config.sh

Cria um ambiente amplo para desenvolvimento baseado no seu perfil técnico (backend, frontend ou data scientist), contendo as seguintes...

### Linguagens

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

### Ferramentas / Frameworks

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

### Uso

Para mais detalhes do uso, acesse o help do script

```bash
./arch-based-dev-config.sh -h
```

PS: Este script sobrescreverá toda vez o arquivo .zshrc, então caso você queira criar variáveis, alias ou personalizar seu tema do oh-my-zsh, escreva esses comandos no arquivo .zsh_profile, pois ele nunca sofrerá alterações de conteúdo

## git-config.sh

CLI simples usando o CLI oficial do GIT para facilitar as seguintes tarefas:

- Configurar usuário global
- Configurar diferentes usuários por pastas
- Gerar diferentes chaves SSH por VCS (Version Control Software)
    - [Bitbucket](https://bitbucket.org/)
    - [GitHub](https://github.com/)
    - [GitLab](https://gitlab.com/)

## gnome-arch-based-mojave-theme-config.sh

Script que aplica o tema Mojave no seu ambiente Gnome 3.

### Uso

Para mais detalhes do uso, acesse o help do script

```bash
./gnome-arch-based-mojave-theme-config.sh -h
```

## vpn-config.sh

Procura por arquivos .ovpn e importa o arqruivo selecionado ao NetworkManager configurando o nome do usuário, senha e um apelido para a conexão
