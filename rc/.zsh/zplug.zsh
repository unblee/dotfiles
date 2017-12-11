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

zplug "zsh-users/zsh-completions"

zplug "mollifier/anyframe"

zplug "docker/docker"
fpath=(${HOME}/.zplug/repos/docker/docker/contrib/completion/zsh $fpath)

zplug "docker/compose"
fpath=(${HOME}/.zplug/repos/docker/compose/contrib/completion/zsh $fpath)

zplug "tcnksm/docker-alias", use:zshrc

zplug "peco/peco", \
  from:gh-r, \
  rename-to:peco${zplug_file_suffix}, \
  as:command

zplug "Masterminds/glide", \
  from:gh-r, \
  rename-to:glide${zplug_file_suffix}, \
  as:command

zplug "unblee/t", \
  from:gh-r, \
  rename-to:t${zplug_file_suffix}, \
  as:command

zplug "monochromegane/the_platinum_searcher", \
  from:gh-r, \
  rename-to:pt${zplug_file_suffix}, \
  as:command

zplug "b4b4r07/http_code", \
  as:command, \
  use:bin/http_code

zplug "simeji/jid", \
  from:gh-r, \
  rename-to:jid${zplug_file_suffix}, \
  as:command

zplug "mattn/memo", \
  from:gh-r, \
  rename-to:memo${zplug_file_suffix}, \
  as:command

zplug "Tarrasch/zsh-autoenv"

zplug "takaaki-kasai/git-foresta", \
  as:command, \
  use:git-foresta

zplug "junegunn/fzf-bin", \
  as:command, \
  from:gh-r, \
  rename-to:fzf${zplug_file_suffix}

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load

# anyframe
bindkey "^r" anyframe-widget-put-history
bindkey "^[" anyframe-widget-cdr

# git-foresta
gf() {
  git-foresta --all --style=10 --graph-margin-right=2 | less -RSX
}
