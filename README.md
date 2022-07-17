# dotfiles

## Setup

### 1. Install Homebrew

https://brew.sh/

### 2. Install git

```sh
git clone https://github.com/unblee/dotfiles.git "$HOME/dotfiles"
```

### 3. Install packages from Brewfile

```sh
brew bundle install --file "$HOME/dotfiles/brew/Brewfile"
```

## Deploy

```sh
"$HOME/dotfiles/scripts/link_all_dot_files"
```
