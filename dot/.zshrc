#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
#

source $HOME/dotfiles/shell/loader

# Emacs like keybind
bindkey -e

# completion
source $DOTFILES/dot/.zsh/completion.zsh

# option
source $DOTFILES/dot/.zsh/option.zsh

# Ctrl-s による端末ロックを無効化する(stty -a でキーバインドを確認できる)
stty stop undef

# tpm(Tmux Plugin Manager)
if [ ! -e ${HOME}/.tmux/plugins/tpm ]; then
  if [ -! -d ${HOME}/.tmux/plugins ]; then
    mkdir -p ${HOME}/.tmux/plugins
  fi
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# git alias
compdef g='git'

# init starship
eval "$(starship init zsh)"

# Loading zinit plugins
source $DOTFILES/dot/.zsh/zinit.zsh

# local settings
[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

# Starting tmux
# NOTE: The location of this section is **required** at the end of the .zshrc.
launch_tmux() {
  if [[ -z "$TMUX" ]]; then
    tmux list-sessions > /dev/null 2>&1
    if [[ $? != 0 ]]; then
      tmux new -s root
      return
    fi
    # already exists sessions
    echo -n "Do you attach to an existing tmux session?(y/N): "
    if read -q; then
      tmux attach -t root
    else
      return  # Start terminal normally
    fi
  fi
}
if _has tmux; then
  launch_tmux
fi
