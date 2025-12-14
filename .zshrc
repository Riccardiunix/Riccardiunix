#!/bin/sh
. $XDG_CONFIG_HOME/aliasrc

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

[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && startx
