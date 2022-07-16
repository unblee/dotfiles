source $HOME/dotfiles/shell/loader

# Ctrl-s による端末ロックを無効化する(stty -a でキーバインドを確認できる)
stty stop undef

# completion
source $DOTFILES/dot/.zsh/completion.zsh

# option
source $DOTFILES/dot/.zsh/option.zsh

# init starship
eval "$(starship init zsh)"

# export ruby gems path
# If not run in .zshrc, system default ruby will be used.
export PATH="$(ruby -e 'print Gem.user_dir + "/bin"'):$PATH"

# local settings
[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

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
