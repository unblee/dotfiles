if [ ! -e $HOME/.vim/bundle ]; then
  echo ""
  echo "="
  echo "= [init] vim"
  echo "="
  echo ""

  echo ""
  echo "##########"

  echo "Starting vim setup"
  echo "Making directory ${HOME}/.vim/bundle"
  # [[ ! -e $HOME/.vim/bundle ]] && mkdir $HOME/.vim/bundle
  # echo "Installing vim plugins"
  # [[ ! -e $HOME/.vim/bundle/neobundle.vim ]] \
  #   && git clone https://github.com/Shougo/neobundle.vim $HOME/dotfiles/.vim/bundle/neobundle.vim \
  #   && vim +NeoBundleInstall +qa

  echo "##########"
  echo ""
fi
