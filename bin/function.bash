#!/bin/bash

# コマンド存在確認
# $? == 0 なら存在している
# $? != 0 なら存在しない
cmd_exists() {
  type "$1" > /dev/null 2>&1
}

# コマンド実行の際の区切り文字列を出力
echo_separator() {
  echo ""
  echo "="; \
  echo "= ${1}"; \
  echo "="; \
  echo ""; \
}

# 各言語のパケッケージをすべてアップデートする
my-update() {
  if [[ "${PLATFORM}" == "darwin" ]];then
    type brew > /dev/null 2>&1 \
      && echo_separator "brew update" \
      && brew update && brew upgrade
  fi
  type npm > /dev/null 2>&1 \
    && echo_separator "npm update" \
    && npm update -g \
  && type gem > /dev/null 2>&1 \
    && echo_separator "gem update" \
    && gem update \
  && type go > /dev/null 2>&1 \
    && echo_separator "go update" \
    && ${DOTFILES}/package/go.bash
}

reload_env() {
  source ~/.zshenv
}

reload_rc() {
  if [[ "$(basename $SHELL)" == "zsh" ]]; then
    source ~/.zshrc
  else
    source ~/.bashrc
  fi
}

venv-init() {
  if [[ ! -d .git/ ]]; then
    git init
  fi
  git rev-parse --is-inside-work-tree 1> /dev/null
  [ $? != 0 ] && return 1

  local TD=$(git rev-parse --show-toplevel)

  if [ ! -d "${TD}/venv" ]; then
    python -m venv "${TD}/venv"
  fi

  local activate_cmd="$(git rev-parse --show-toplevel)/venv/bin/activate"
  source "${activate_cmd}"

  pip install yapf

  local _prompt=$(
  echo ${PROMPT} | sed 's/(venv)//'
  )
  PROMPT=${_prompt}

  echo "source ${activate_cmd}" > "${TD}/.autoenv.zsh"
  cat << "EOF" >> "${TD}/.autoenv.zsh"
local _prompt=$(
echo ${PROMPT} | sed 's/(venv)//'
)
PROMPT=${_prompt}
EOF
  echo 'deactivate' > "${TD}/.autoenv_leave.zsh"
}

pipenv-init() {
  if [[ ! -d .git/ ]]; then
    git init
  fi
  git rev-parse --is-inside-work-tree 1> /dev/null
  [ $? != 0 ] && return 1

  local TD=$(git rev-parse --show-toplevel)

  pipenv --venv > /dev/null 2>&1
  if [ $? != 0 ]; then
    pipenv install --dev yapf flake8
  fi

  pipenv shell
}

cmd_exists minikube
if [[ $? == 0 ]]; then
  minikube-start-with-docker-env() {
    minikube start
    echo "Load 'minikube docker-env'"
    eval $(minikube docker-env)
  }
fi

