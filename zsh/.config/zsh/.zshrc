#!/usr/bin/env zsh

### Preferences
# Dreams of Autonomy: https://www.youtube.com/watch?v=ud7YxC33Z3w

# echo '.config/zsh/.shrc day ne'
# run source ~/.zshrc or source ~/.bashrc
# source ~/.config/zsh/.zshrc

### TODO:
# zsh bd instead of cd multiple times: https://github.com/Tarrasch/zsh-bd

# test gnu stow

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  # 
  # Set PATH, MANPATH, etc., for Homebrew. Make homebrew-installed apps avaiable in your path
  # If don't have this line, eval fzf & zoxide will yield error
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# auto-added by fzf install script
# fzf này tải bằng git lưu ở ~/.fzf/bin. Trong này có luôn uninstall script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source nvm - node version manager
# `-s` true if file exists
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fpath=($DOTFILES/zsh/plugins $fpath)
# fpath=($ZDOTDIR/plugins $fpath)

### START Zinit's installer chunk (Automatically added by Zinit's installer)
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Source/Load zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

### Zinit's plugins should be put after sourcing of zinit
# These following lines only work with zinit, `ice` and `light` là command của zinit để install plugins

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

### Add in snippets
# zinit snippet OMZL::git.zsh
zinit snippet OMZP::git     # OMZP = Oh My Zsh Plugin Url
# zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::aws
# zinit snippet OMZP::kubectl
# zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# Must be placed under compinit
# why: https://github.com/zdharma-continuum/zinit
zinit cdreplay -q

### ===== Start keybindings =====
bindkey -e  # emac mode include a number of different useful key bindings
bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# https://github.com/edr3x/tmux-sessionizer
# Conflict with shell emac move forward
# bindkey -s '^f' 'tmux-sessionizer\n'

### ===== End keybindings =====

### START options
# set/un-set options using setopt or unsetopt

# History options
HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
HISTSIZE=10000                   # Maximum events for internal history
SAVEHIST=$HISTSIZE                 # Maximum events in history file
HISTDUP=erase
setopt appendhistory    # not over-write
setopt sharehistory     # share across all zsh session
setopt hist_ignore_space  # add a space before a command to not save to history
setopt hist_ignore_all_dups
setopt hist_save_no_dups  # Do not write a duplicate event to the history file.
setopt hist_ignore_dups
setopt hist_find_no_dups    # history search no duplicate

### END options

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'    # auto-completion is case-sensitive by default
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # auto-completion w/ color
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ALIASES
# source $DOTFILES/aliases/aliases
source $ZDOTDIR/aliases/aliases

# Shell integrations
eval "$(fzf --zsh)" # install with homebrew

# export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# ======== start ZOXIDE integration ========
# new command: z, zi (though 'zi' will conflict with zinit package manager for zsh)
# eval "$(zoxide init zsh)"

# change the commands to: j and ji
# eval "$(zoxide init --cmd j zsh)"   # must be added after compinit is called

# replace the cd commnand with zoxide, and new command 'cdi' for interactive mode
eval "$(zoxide init --cmd cd zsh)"
# ======== end ZOXIDE integration ========

# ruby version manager
# source /Users/anhao/.rvm/scripts/rvm

# ruby version manager
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Wezterm terminal emulator
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

# Move back to the original CWD When Exiting Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# uv python
. "$HOME/.local/bin/env"

# laravel php
export PATH="$HOME/.composer/vendor/bin:$PATH"