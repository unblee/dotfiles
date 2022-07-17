# dotfiles

## Setup

### 1. Install Homebrew

https://brew.sh/

### 2. Use Homebrew

```sh
eval $(/opt/homebrew/bin/brew shellenv)
```

### 3. Install git

```sh
git clone https://github.com/unblee/dotfiles.git "$HOME/dotfiles"
```

### 4. Install packages from Brewfile

```sh
brew bundle install --file "$HOME/dotfiles/brew/Brewfile"
```

## Deploy

### 1. Link all dot files

```sh
"$HOME/dotfiles/scripts/link_all_dot_files"
```

### 2. Restart terminal

Stop Terminal.app && Run iTerm.app
