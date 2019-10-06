source ${DOTFILES}/bin/function.bash

[[ ${PLATFORM} == "windows" ]] \
  && zplug_file_suffix=".exe" \
  || zplug_file_suffix=""

if [[ -d $ZPLUG_HOME ]]; then
else
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-completions", lazy:true

zplug "b4b4r07/http_code", \
  as:command, \
  use:bin/http_code, \
  lazy:true

zplug "simeji/jid", \
  from:gh-r, \
  rename-to:jid${zplug_file_suffix}, \
  as:command, \
  lazy:true

zplug "Tarrasch/zsh-autoenv", lazy:true

zplug "takaaki-kasai/git-foresta", \
  as:command, \
  use:git-foresta, \
  lazy:true

zplug "junegunn/fzf-bin", \
  from:gh-r, \
  rename-to:fzf${zplug_file_suffix}, \
  as:command, \
  lazy:true

zplug "paulirish/git-open", as:plugin

zplug "unblee/chksum", \
  from:gh-r, \
  rename-to:chksum${zplug_file_suffix}, \
  as:command, \
  lazy:true

zplug "lukechilds/zsh-nvm", lazy:true

# zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load

# history
_select-history() {
  BUFFER=$(history -n -r 1 | fzf --reverse --height 70% --no-sort --query "$LBUFFER" --prompt="history> ")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N _select-history
bindkey '^r' _select-history

# cdr
_select_recent_dir() {
  local target=$(cdr -l | gawk '{print $2}' | fzf --reverse --no-sort --height 70% --prompt="cdr> ")
  if [[ ! -n $target ]]; then
    zle reset-prompt
    return
  fi
  BUFFER="cd ${target}"
  zle accept-line
}
zle -N _select_recent_dir
bindkey "^[" _select_recent_dir

# ghq で管理されているディレクトリに移動
cmd_exists ghq
if [[ $? == 0 ]]; then
  _ghq_cd() {
    local target=$(find "${GHQ_ROOT}" -maxdepth 3 -type d | sed "1d; s|${GHQ_ROOT}/||" | fzf --reverse --height 70%)
    if [[ ! -n ${target} ]]; then
      zle reset-prompt
      return
    fi
    BUFFER="cd ${GHQ_ROOT}/${target}"
    zle accept-line
  }
  zle -N _ghq_cd
  bindkey "^]" _ghq_cd
fi

# git-foresta
gf() {
  git-foresta --all --style=10 --graph-margin-right=2 | less -RSX
}
