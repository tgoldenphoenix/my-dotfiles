#!/usr/bin/env zsh

# test gnu stow

# echo ".zshenv loaded"
# This file should only define environment variables.

# EXPORT ENVIRONMENT VARIABLE: PATH

# XDG Base Directory | XDG = Cross (X) Desktop Group
export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share" # ~/.config/local/share
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"      # ~/.config/cache

# editor | can also use "vim"
export EDITOR="nvim"
export VISUAL="nvim"

# some Zsh environment variables

# Where the .zshrc is located
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"   # ~/.config/zsh (use gnu stow)

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

### $PATH environment variable

# flutter
# export PATH=~/Development/flutter/bin:$PATH

# For CocoaPods
# export PATH=$HOME/.gem/bin:$PATH

# for flutterfire_cli
# export PATH="$PATH":"$HOME/.pub-cache/bin"

# postgres psql
# So we can use psql
export PATH="/Library/PostgreSQL/15/bin/:$PATH"
# export PATH="/Applications/PostgreSQL 15/:$PATH"
# export PATH="/Applications/Postgres.app/Contents/Versions/15/bin:$PATH"

# For Java jdk
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
# export JAVA_HOME=$(/usr/libexec/java_home -v 21.0.1)
# export PATH=$JAVA_HOME/bin:$PATH

# for nodejs
export PATH=$PATH:/usr/local/bin

# add latex to path on ubuntu
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH

# my custom scripts
# include tmux-sessionizer
export PATH=$PATH:$HOME/bin

# Rust & cargo
. "$HOME/.cargo/env"