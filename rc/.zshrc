#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
#

#
# function
#

source ${DOTFILES}/bin/function.bash

#
# completion
#

# travis gem
[ -f /home/unblee/.travis/travis.sh ] && source /home/unblee/.travis/travis.sh

COMPLETIONS_DIR=${DOTFILES}/rc/.zsh/completions

# kubectl(k8s) completion
cmd_exists kubectl
[[ $? == 0 ]] && kubectl completion zsh > ${COMPLETIONS_DIR}/_kubectl

# helm(k8s) completion
cmd_exists helm
[[ $? == 0 ]] && eval helm completion zsh > ${COMPLETIONS_DIR}/_helm

# kops(k8s) completion
cmd_exists kops
[[ $? == 0 ]] && eval kops completion zsh > ${COMPLETIONS_DIR}/_kops

# # aws-cli completion
# cmd_exists aws_zsh_completer.sh
# [[ $? == 0 ]] && source aws_zsh_completer.sh

# rustup completion
cmd_exists rustup
[[ $? == 0 ]] && eval rustup completions zsh > ${COMPLETIONS_DIR}/_rustup

# pyenv
cmd_exists pyenv
[[ $? == 0 ]] && eval "$(pyenv init -)"

# heptio/ark
cmd_exists ark
[[ $? == 0 ]] && ark completion zsh > ${COMPLETIONS_DIR}/_ark

# minikube
cmd_exists minikube
[[ $? == 0 ]] && minikube completion zsh > ${COMPLETIONS_DIR}/_minikube

#
# settings for fpath
# NOTE: set fpath before compinit
#

fpath+=${COMPLETIONS_DIR}

#
# keybind
#

# Emacs like keybind
bindkey -e

#
# zsh completion
#

# 補完機能を有効にする
autoload -Uz compinit; compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                       /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 色を使用できるようにする
autoload -Uz colors; colors

# 補完時の色を設定
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

#
# option
#

# 複数のzshを同時に使うときなどhistoryファイルに上書きせず追加する
setopt append_history

# コマンド入力の際に先頭に半角スペースを入れると履歴に残らないようにする
setopt hist_ignore_space

# 直前のコマンドと同じ場合は履歴に追加しない
setopt hist_ignore_dups

# 重複するコマンドが記録されるとき古い方を削除する
setopt hist_ignore_all_dups

# 重複するコマンドが保存されるとき古い方を削除する
setopt hist_save_no_dups

# 余分な空白を削除したものを履歴に保存する
setopt hist_reduce_blanks

# 履歴検索で重複しているものを表示しない
setopt hist_find_no_dups

# 古い履歴を削除する必要がある場合まず重複しているものから削除する
setopt hist_expire_dups_first

# BEEP音を鳴らさないようにする
setopt nolistbeep

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd

# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 補完が/で終って、つぎが、語分割子か/かコマンドの後(;とか&)だったら、補完末尾の/を取る
unsetopt auto_remove_slash

# 曖昧な補完で、自動的に選択肢をリストアップ
setopt auto_list

# 変数名を補完する
setopt auto_param_keys

#  サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt auto_resume

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 明確なドットの指定なしで.から始まるファイルをマッチ
# rm *で確認
unsetopt rm_star_wait

# 行の末尾がバッククォートでも無視する
setopt sun_keyboard_hack

# 補完候補など表示する時はその場に表示し、終了時に画面から消す
setopt always_last_prompt

# ディレクトリ名を補完すると、末尾がスラッシュになる。
setopt auto_param_slash

# コマンドのスペルの訂正を使用する
setopt correct

# aliasを展開して補完
setopt complete_aliases

# "*" にドットファイルをマッチ
setopt glob_dots

# 補完候補を詰めて表示
setopt list_packed

# 補完の時にベルを鳴らさない
setopt no_list_beep

# =以降でも補完できるようにする
setopt magic_equal_subst

# ファイル名で , ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

# ワンライナーにコメントを残せるようにする
setopt interactivecomments

#
# zplug
#

source ${DOTFILES}/rc/.zsh/zplug.zsh


#
# alias
#

source ${DOTFILES}/bin/alias.bash

# cd 履歴の管理
# http://blog.n-z.jp/blog/2013-11-12-zsh-cdr.html
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  # cdr, add-zsh-hook の有効化
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  # cdr の設定
  zstyle ':completion:*:*:cdr:*:*' menu selection
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-max 5000
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-pushd true
fi

# Ctrl-s による端末ロックを無効化する(stty -a でキーバインドを確認できる)
stty stop undef

# mosh 補完
compdef mosh=ssh

# git alias
compdef g='git'

# anyenv
if [ -e ${HOME}/.anyenv ]; then
  export PATH=${HOME}/.anyenv/bin:${PATH}
  eval "$(anyenv init -)"
fi

#
# prompt
#

source ${DOTFILES}/rc/.zsh/prompt.zsh

#
# tpm(Tmux Plugin Manager)
#

if [ ! -e ${HOME}/.tmux/plugins/tpm ]; then
  if [ -! -d ${HOME}/.tmux/plugins ]; then
    mkdir -p ${HOME}/.tmux/plugins
  fi
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

#
# tmux
#

# http://qiita.com/ssh0/items/a9956a74bff8254a606a
cmd_exists tmux
if [[ $? == 0 ]]; then
  if [[ -z $TMUX ]]; then
    # already exists sessions
    tmux list-sessions > /dev/null 2>&1
    if [[ $? != 0 ]]; then
      tmux new-session
      exit
    fi

    TMUX_ID=`tmux list-sessions`

    create_new_session="Create New Session"
    TMUX_ID="${create_new_session}:\n${TMUX_ID}"
    TMUX_ID=`echo ${TMUX_ID} | fzf --reverse | cut -d: -f1`

    if [[ "$TMUX_ID" == "${create_new_session}" ]]; then
      tmux new-session
      exit
    elif [[ -n "$TMUX_ID" ]]; then
      tmux attach-session -t "$TMUX_ID"
      exit
    else
      :  # Start terminal normally
    fi
  fi
fi

# pipenv completion
cmd_exists pipenv
[[ $? == 0 ]] && eval "$(pipenv --completion)"

#
# local settings
#

[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

cmd_exists gocomplete
if [[ $? == 0 ]]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C ${GOPATH}/bin/gocomplete go
fi
