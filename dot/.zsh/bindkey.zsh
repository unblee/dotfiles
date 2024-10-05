. "${DOTFILES}/shell/funcs"

# disable ctrl+d
# https://zenn.dev/yumafuu/articles/zsh-ctrl-d-do-nothing
zle -N _do_nothing
bindkey "^D" _do_nothing
setopt IGNORE_EOF

# Emacs like keybind
bindkey -e

# history
_select-history() {
  BUFFER=$(history -n -r 1 | fzf --reverse --height 70% --no-sort --query "$LBUFFER" --prompt="history> ")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N _select-history
bindkey '^r' _select-history

# # cdr
# _select_recent_dir() {
#   local target=$(cdr -l | gawk '{print $2}' | fzf --reverse --no-sort --height 70% --prompt="cdr> ")
#   if [[ ! -n $target ]]; then
#     zle reset-prompt
#     return
#   fi
#   BUFFER="cd ${target}"
#   zle accept-line
# }
# zle -N _select_recent_dir
# bindkey "^[" _select_recent_dir

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
