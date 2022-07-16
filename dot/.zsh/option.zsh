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

# disable ctrl+d
# https://zenn.dev/yumafuu/articles/zsh-ctrl-d-do-nothing
zle -N _do_nothing
bindkey "^D" _do_nothing
setopt IGNORE_EOF

# Emacs like keybind
bindkey -e
