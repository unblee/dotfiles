#!/bin/bash

# find
[[ "${PLATFORM}" == "windows" ]] && alias find="/usr/bin/find.exe"

# ls
case "${PLATFORM}" in
  darwin)
    alias ls="ls -G"
    alias ll="ls -lG"
    alias la="ls -laG"
    ;;
  *)
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -la --color'
    ;;
esac

# clear
alias cls="clear"

# vim
[[ "${PLATFORM}" == "windows" ]] && alias vim=gvim
type nvim > /dev/null 2>&1
[ $? -eq 0 ] && alias vim=nvim
alias vi=vim

# fzf
if type files > /dev/null 2>&1 && type fzf > /dev/null 2>&1; then
  alias gap="git ls-files --modified | fzf --reverse --multi | xargs git add && git status --short --branch"
fi

alias cdu='cd `git rev-parse --show-toplevel`'

# clipboard
if [[ "${PLATFORM}" == "linux" ]]; then
  alias pbcopy="xsel --clipboard --input"
  alias pbpaste="xsel --clipboard --output 2> /dev/null"
fi

# tmux
alias tmux="TERM=xterm tmux -2"

# git
alias ga="git add"
alias gam="git commit --amend"
alias gom="git commit -m"
alias gs="git status --short --branch"
alias gi="git diff"
alias gic="git diff --cached"
alias gpull="git pull"
alias gpush="git push"
alias g=git

# ripgrep
if type rg > /dev/null 2>&1; then
  alias rg="rg --hidden --smart-case --glob='!.git/'"
fi

# cd
alias ...='cd ../..'
alias ....='cd ../../..'
