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

_has cargo && [[ ! -e "$compdir/_cargo" ]] && ln -s ~/.rustup/toolchains/stable-x86_64-apple-darwin/share/zsh/site-functions/_cargo $compdir/_cargo
_has rustup && rustup completions zsh > $compdir/_rustup

# added by travis gem
[ -f /Users/unblee/.travis/travis.sh ] && source /Users/unblee/.travis/travis.sh

source "$(brew --prefix asdf)/asdf.sh"

# NOTE: set fpath before compinit
fpath=(/usr/local/share/zsh/site-functions ~/.zsh/completions $fpath)
