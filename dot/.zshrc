. "$HOME/dotfiles/shell/loader"

# Ctrl-s による端末ロックを無効化する(stty -a でキーバインドを確認できる)
stty stop undef

# option
. "$DOTFILES/dot/.zsh/option.zsh"

# bindkey
. "$DOTFILES/dot/.zsh/bindkey.zsh"

# init starship
eval "$(starship init zsh)"

# load sheldon
eval "$(sheldon source)"

# export ruby gems path
# If not run in .zshrc, system default ruby will be used.
export PATH="$(ruby -e 'print Gem.user_dir + "/bin"'):$PATH"

# local settings
[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

# completion
source $DOTFILES/dot/.zsh/completion.zsh

# tpm(Tmux Plugin Manager)
if [ ! -e ${HOME}/.tmux/plugins/tpm ]; then
  if [ -! -d ${HOME}/.tmux/plugins ]; then
    mkdir -p ${HOME}/.tmux/plugins
  fi
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if _has tmux; then
  # NOTE: The location of this section is **required** at the end of the .zshrc.
  launch_tmux
fi

# # For profiling
# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi
