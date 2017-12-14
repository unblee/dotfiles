#
# ~/.bashrc
#

source ${HOME}/dotfiles/bin/env.bash
source ${HOME}/dotfiles/bin/alias.bash
source ${HOME}/dotfiles/bin/function.bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# added by travis gem
[ -f /home/unblee/.travis/travis.sh ] && source /home/unblee/.travis/travis.sh

cmd_exists gocomplete
[[ $? == 0 ]] && complete -C ${GOPATH}/bin/gocomplete go
