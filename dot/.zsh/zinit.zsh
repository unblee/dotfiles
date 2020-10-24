source $DOTFILES/shell/funcs

if [[ ! -e ~/.zinit/bin ]]; then
  mkdir ~/.zinit
  git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
fi

source ~/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Tarrasch/zsh-autoenv
zinit light paulirish/git-open
zinit light lukechilds/zsh-nvm

zinit ice as"program" pick"bin/http_code"
zinit load b4b4r07/http_code

zinit ice from"gh-r" as"program"
zinit load simeji/jid

zinit ice as"program" pick"git-foresta"
zinit load takaaki-kasai/git-foresta

zinit ice from"gh-r" as"program" mv"chksum_v0.2.0_darwin_amd64/chksum -> chksum"
zinit load unblee/chksum

zinit ice from"gh-r" as"program"
zinit load b4b4r07/git-bump

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
_has ghq
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

