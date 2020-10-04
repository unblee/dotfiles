#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
#

source $HOME/dotfiles/shell/loader

#
# settings for fpath
# NOTE: set fpath before compinit
#

if [[ ! -e ~/.zinit/bin ]]; then
  mkdir ~/.zinit
  git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
fi

source ~/.zinit/bin/zinit.zsh

compdir=~/.zsh/completions
_has kops && (bash -c "kops completion zsh > $compdir/_kops" &)
_has minikube && (bash -c "minikube completion zsh > $compdir/_minikube" &)
_has rustup && (bash -c "rustup completions zsh > $compdir/_rustup" &)
_has cargo && [[ ! -e "$compdir/_cargo" ]] && ln -s ~/.rustup/toolchains/stable-x86_64-apple-darwin/share/zsh/site-functions/_cargo $compdir/_cargo


fpath=(/usr/local/share/zsh/site-functions ~/.zsh/completions $fpath)
autoload -Uz compinit
compinit

#
# keybind
#

# Emacs like keybind
bindkey -e

#
# zsh completion
#

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
_has tmux
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
_has pipenv
[[ $? == 0 ]] && eval "$(pipenv --completion)"

#
# local settings
#

[[ -e ${HOME}/.zshrc.local ]] && source ${HOME}/.zshrc.local

_has gocomplete
if [[ $? == 0 ]]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C ${GOPATH}/bin/gocomplete go
fi
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# added by travis gem
[ -f /Users/unblee/.travis/travis.sh ] && source /Users/unblee/.travis/travis.sh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Tarrasch/zsh-autoenv
zinit light paulirish/git-open
zinit light lukechilds/zsh-nvm

zinit ice as"program" pick"bin/http_code"
zinit load b4b4r07/http_code

zinit ice from"gh-r" as"program"
zinit load simeji/jid

zinit ice as"program" pick"git-foresta"
zinit load takaaki-kasai/git-foresta

zinit ice from"gh-r" as"program" mv"chksum_v0.2.0_darwin_amd64/chksum -> chksum"
zinit load unblee/chksum

zinit ice from"gh-r" as"program"
zinit load b4b4r07/git-bump

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
_has ghq
if [[ $? == 0 ]]; then
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

# git alias
compdef g='git'

export PATH=$HOME/local/google-cloud-sdk/bin:$PATH
source $HOME/local/google-cloud-sdk/completion.zsh.inc

export PATH=/Users/unblee/bin:$PATH

eval "$(starship init zsh)"

source /usr/local/opt/asdf/asdf.sh
