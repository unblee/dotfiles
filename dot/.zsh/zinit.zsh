source $DOTFILES/shell/funcs

# if [[ ! -e ~/.zinit/bin ]]; then
#   mkdir ~/.zinit
#   git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
# fi
# 
# source ~/.zinit/bin/zinit.zsh

# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# source "${ZINIT_HOME}/zinit.zsh"
# 
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit
# 
# # Enable turbo mode
# zinit wait lucid light-mode for \
#   Tarrasch/zsh-autoenv \
#   paulirish/git-open \
#   zdharma-continuum/fast-syntax-highlighting \
#   hlissner/zsh-autopair \
#   as"program" pick"bin/http_code" \
#     b4b4r07/http_code \
#   from"gh-r" as"program" \
#     simeji/jid \
#   as"program" pick"git-foresta" \
#     takaaki-kasai/git-foresta \
#   from"gh-r" as"program" \
#     b4b4r07/git-bump
# 
#   # from"gh-r" as"program" mv"chksum_v0.2.0_darwin_amd64/chksum -> chksum" \
#   #   unblee/chksum \
# 
# # Enable turbo mode
# # zinit wait lucid atload"zicompinit; zicdreplay" blockf light-mode for \
# #   zsh-users/zsh-completions

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
if _has ghq; then
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

