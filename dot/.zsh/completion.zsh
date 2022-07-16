source ${DOTFILES}/shell/funcs

# Configuration completion of zsh
#-----------------------

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

# Configuring completion of user added commands
#-----------------------------------------------

compdir=~/.zsh/completions
[[ ! -d "$compdir" ]] && mkdir "$compdir" || true

if _has rustup; then
  rustup completions zsh rustup > "$compdir/_rustup"
  rustup completions zsh cargo > "$compdir/_cargo"
fi

. $(brew --prefix asdf)/libexec/asdf.sh

# NOTE: set FPATH before compinit
export FPATH="$compdir:$FPATH"

autoload -Uz compinit && compinit
