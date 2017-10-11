#!/bin/bash

[[ ! -d "${HOME}/workspace/src/local/unblee" ]] \
  && mkdir -p ${HOME}/workspace/src/{local,github.com}/unblee
if type brew > /dev/null 2>&1; then
  [[ ! -d "${HOME}/.linuxbrew" ]] && mkdir "${HOME}/.linuxbrew"
fi
[[ ! -d "${HOME}/local/bin" ]] && mkdir -p "${HOME}/local/bin"

source ${HOME}/dotfiles/bin/env.bash
source ${HOME}/dotfiles/bin/link.bash
# source ${HOME}/dotfiles/bin/init.d/*
