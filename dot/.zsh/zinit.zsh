source $DOTFILES/shell/funcs

if [[ ! -e ~/.zinit/bin ]]; then
  mkdir ~/.zinit
  git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
fi

source ~/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Disable turbo mode
zinit light qoomon/zsh-lazyload

# Enable turbo mode
zinit wait lucid light-mode for \
  Tarrasch/zsh-autoenv \
  paulirish/git-open \
  zdharma/fast-syntax-highlighting \
  as"program" pick"bin/http_code" \
    b4b4r07/http_code \
  from"gh-r" as"program" \
    simeji/jid \
  as"program" pick"git-foresta" \
    takaaki-kasai/git-foresta \
  from"gh-r" as"program" mv"chksum_v0.2.0_darwin_amd64/chksum -> chksum" \
    unblee/chksum \
  from"gh-r" as"program" \
    b4b4r07/git-bump

# Enable turbo mode
zinit wait lucid atload"zicompinit; zicdreplay" blockf light-mode for \
  zsh-users/zsh-completions

# lazyload completions
_has kubectl && lazyload kubectl -- "source <(kubectl completion zsh)"
_has kops && lazyload kops -- "source <(kops completion zsh)"
_has minikube && lazyload minikube -- "source <(minikube completion zsh)"
_has poetry && lazyload poetry -- "source <(poetry completions)"
_has kind && lazyload kind -- 'source <(kind completion zsh; echo compdef _kind kind)'
_has helm && lazyload helm -- 'source <(helm completion zsh)'

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

