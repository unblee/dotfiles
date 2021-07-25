#
# ~/.bashrc
#

source ${HOME}/dotfiles/lib/env
source ${HOME}/dotfiles/lib/utils
source ${HOME}/dotfiles/lib/alias

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# added by travis gem
[ -f /home/unblee/.travis/travis.sh ] && source /home/unblee/.travis/travis.sh

cmd_exists gocomplete
[[ $? == 0 ]] && complete -C ${GOPATH}/bin/gocomplete go

# added by travis gem
[ -f /Users/unblee/.travis/travis.sh ] && source /Users/unblee/.travis/travis.sh
