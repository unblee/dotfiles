if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
