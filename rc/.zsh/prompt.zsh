# PROMPT 変数の中の変数参照をプロンプト表示時に展開
setopt prompt_subst

# 出力の文字列末尾に改行コードが無い場合でも表示
# というか改行した後に % と表示されるのをなくす
unsetopt promptcr

# エスケープシーケンスに適応した色を定義
fg_red=${fg[red]}
fg_blue=${fg[blue]}
fg_yellow=${fg[yellow]}
fg_green=${fg[green]}
fg_white=${fg[white]}
fg_black=${fg[black]}

bg_red=${bg[red]}
bg_blue=${bg[blue]}
bg_yellow=${bg[yellow]}
bg_green=${bg[green]}
bg_white=${bg[white]}
bg_black=${bg[black]}

# プロンプトを可愛くする
# http://ayatk.com/blog/zsh-prompt/
# (o´･w･)
# (o´-w･)?
# (o`･w･)

# venv 環境か表示
_is_venv() {
  if [ -n "${VIRTUAL_ENV}" ]; then
    local s="venv"
    if [ -n "${PIPENV_ACTIVE}" ]; then
      s="pipenv"
    fi
    echo -n "%{$bg_yellow%}%{$fg_white%} ${s} %{$reset_color%}%{$reset_color%}"
  fi
}

# カレントディレクトリを表示
_current_directory() {
  echo -n "%{$bg_blue%}%{$fg_white%} %~ %{$reset_color%}%{$reset_color%}"
}

# git のブランチ名を表示
_git_branch() {
  local rev_name=$(git name-rev --name-only HEAD 2> /dev/null)
  [[ -z $rev_name ]] || \
    echo -n "%{$bg_green%}%{$fg_white%} $rev_name %{$reset_color%}%{$reset_color%}"
}

# 左プロンプト
PROMPT='
$(_is_venv)$(_current_directory)$(_git_branch)
%(?.(o-w-%) <.%{$fg_red%}(oxwx%) <%{$reset_color%}) '

# 間違い補完
SPROMPT="%{$fg_yellow%}(o?w?) <%{$reset_color%} もしかして%{$fg_green%} %U%r%u %{$reset_color%}かな? [そう!(y), 違う!(n), a, e]: "
