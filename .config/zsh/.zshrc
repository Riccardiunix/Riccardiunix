#!/bin/sh
export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export GDBHISTFILE="$XDG_CONFIG_HOME"/gdb/gdb_history
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:"$XDG_DATA_HOME"/icons
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js   
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm                             
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export RXVT_SOCKET="$XDG_DATA_HOME"/urxvt/urxvt-socket
export WINEPREFIX="$XDG_DATA_HOME"/wine

. $XDG_CONFIG_HOME/aliasrc

export HISTFILE=$XDG_DATA_HOME/zsh/histfile

HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
bindkey -e

zstyle :compinstall filename ~/.zshrc

autoload -Uz compinit promptinit
compinit -d $XDG_DATA_HOME/zsh/zcompdump
zstyle ':completion:*' rehash true menu select
zmodload zsh/complist
promptinit
_com_option+=(globdots)

autoload -U colors && colors
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt AUTO_CD

PS1=' %F{5}>%f '
RPROMPT='%F{3}%1~%f'

. "$XDG_CONFIG_HOME"/lf/lfcd.sh
