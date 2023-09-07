export EDITOR=nvim
export PAGER=less

export WORK=$HOME/work
# Universal paths
export XDG_CONFIG_HOME=$HOME/.config

export ZENV=$HOME/.zshenv
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZRC=$ZDOTDIR/zshrc
export ZCONF=$ZRC
export ZPLUG=$ZDOTDIR/plugins
export ZCOMP=$ZDOTDIR/completion

export VIMRC=$XDG_CONFIG_HOME/nvim/init.lua
export VIMCONF=$VIMRC
export ALIASES=$XDG_CONFIG_HOME/misc/aliases

# export DOCKER_DEFAULT_PLATFORM=linux/amd64

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
# Homebrew
# export GOROOT="$(brew --prefix golang)/libexec"
export GOROOT=/opt/homebrew/opt/go/libexec
# Manual install
# export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH=$HOME/perl5/bin/:$PATH
export PATH=$HOME/nvim-macos/bin/:$PATH
