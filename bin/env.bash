#!/bin/bash

export DOTFILES=${HOME}/dotfiles

source ${DOTFILES}/bin/function.bash

# Support XDG Base Directory
export XDG_CONFIG_HOME=${HOME}/.config

# /usr/local/bin が PATH に無いとき追加
[[ -d /usr/local/bin ]] && [[ $PATH =~ /usr/local/bin ]] || export PATH=/usr/local/bin:$PATH

# dotfiles path

# 言語設定
export LANG=C
export LC_CTYPE=ja_JP.UTF-8

# OS判定
case "$(/usr/bin/uname | /usr/bin/tr '[:upper:]' '[:lower:]')" in
  *'linux'*)
    export PLATFORM=linux
    ;;
  *'darwin'*)
    export PLATFORM=darwin
    ;;
  *'bsd'*)
    export PLATFORM=bsd
    ;;
  *)
    export PLATFORM=windows
esac

# for macOS
if [[ "${PLATFORM}" == "darwin" ]]; then
  if [[ -e /usr/local/opt/gnu-sed/libexec/gnubin ]]; then
    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
  fi
fi

# Windows のホームディレクトリを設定
[[ "${PLATFORM}" == "windows" ]] && WINDOWS_HOME=$(cygpath -w ${HOME})

# ページャ
export PAGER=less

# エディタ設定
export EDITOR=vim

# 区切り文字の設定
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ヒストリ設定
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# golang
if type go > /dev/null 2>&1; then
  export GOPATH=$HOME/workspace
  export PATH=$GOPATH/bin:$PATH
  export GO15VENDOREXPERIMENT=1
fi

# Linuxbrew
if type brew > /dev/null 2>&1; then
  export PATH=$HOME/.linuxbrew/bin:$PATH
  export LD_LIBRARY_PATH=$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH
fi

# ls のカラー設定
# http://news.mynavi.jp/column/zsh/009/
# からコピペ（適当）
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ユーザがインストールするバイナリの置き場所
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/local/bin:$PATH

# ruby
if $(type ruby > /dev/null 2>&1); then
  ruby_version=$(ruby -v | cut -f 2 -d " " | sed -r "s/([0-9]\.[0-9])\..+/\1.0/")
  ruby_bin_dir=${HOME}/.gem/ruby/${ruby_version}/bin
  [[ -d ${ruby_bin_dir} ]] && export PATH=${ruby_bin_dir}:${PATH}
fi

# docker env settings for windows
if type docker > /dev/null 2>&1 && [[ "${PLATFORM}" == windows ]]; then
  export DOCKER_TLS_VERIFY="1"
  export DOCKER_HOST="tcp://192.168.99.100:2376"
  export DOCKER_CERT_PATH="${WINDOWS_HOME}\\.docker\\machine\\machines\\default"
  export DOCKER_MACHINE_NAME="default"
fi

# ghq
export GHQ_ROOT=$GOPATH/src

# mingw
if [[ -e /mingw64/bin ]]; then
  export PATH=/mingw64/bin:$PATH
fi

# git beautiful diff
if [[ -e /usr/share/git/diff-highlight ]]; then
  export PATH=/usr/share/git/diff-highlight:$PATH
fi

# zplug
export ZPLUG_HOME=~/.zplug
export PATH=${ZPLUG_HOME}/bin:${PATH}

# rust/cargo
if [[ -e "${HOME}/.cargo" ]]; then
  export PATH=${HOME}/.cargo/bin:${PATH}
fi

# pipenv
export PIPENV_SHELL_FANCY=1

# composer
export PATH="${HOME}/.config/composer/vendor/bin:${PATH}"

# pyenv
cmd_exists pyenv
[[ $? == 0 ]] && export PYENV_ROOT="$(pyenv root)"

# nvm
export NVM_DIR="$HOME/.nvm"
export NODE_VERSIONS="$NVM_DIR/versions/node"
export NODE_VERSION_PREFIX=""
