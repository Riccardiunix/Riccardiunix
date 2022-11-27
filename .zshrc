#!/bin/sh
export PATH=$HOME/.local/bin:$HOME/.local/share/cargo/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export HISTFILE=$XDG_DATA_HOME/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
bindkey -e

zstyle :compinstall filename $HOME/.zshrc

autoload -Uz compinit promptinit
zstyle ':completion:*' menu select
setopt completealiases
zmodload zsh/complist
compinit -d $XDG_DATA_HOME/zsh/zcompdump
promptinit
_com_option+=(globdots)
#prompt walters

autoload -U colors && colors
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt AUTO_CD

source $XDG_CONFIG_HOME/aliases

export GREP_COLORS='mt=1;32'

export EDITOR=nvim
export BROWSER=librewolf
export GUI_EDITOR=geany
export VISUAL=nvim
export TERMINAL=urxvtc
export TERMCMD=urxvtc
export READER=zathura
export PAGER=less
export MANPAGER="dash -c 'col -bx | bat -l man -p'"

export LIBVA_DRIVER_NAME=nvidia
export VDPAU_DRIVER=nvidia
export MESA_NO_DITHER=1

export _JAVA_AWT_WM_NONREPARENTING=1
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export CRAWL_DIR="$XDG_DATA_HOME"/crawl/
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export ANDROID_HOME="$XDG_DATA_HOME"/android
export JAVA_HOME=/usr/lib/jvm/default
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export PYTHONSTARTUP="/etc/python/pythonrc"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export MBSYNCRC="$XDG_CONFIG_HOME"/isync/mbsyncrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export RXVT_SOCKET='/tmp/urxvt-socket'
export QT_QPA_PLATFORMTHEME=qt5ct
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv

export GST_PLUGIN_FEATURE_RANK=nvmpegvideodec:MAX,nvmpeg2videodec:MAX,nvmpeg4videodec:MAX,nvh264sldec:MAX,nvh264dec:MAX,nvjpegdec:MAX,nvh265sldec:MAX,nvh265dec:MAX,nvvp9dec:MAX,avdec_av1:NONE,av1dec:NONE

PS1='%B%F{1}[%f%F{3}%n%f%F{2}@%f%F{6}%m %F{5}%1/%f%F{red}]%f%b
 %F{4}>%f '

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sx
fi
