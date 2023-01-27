#!/bin/sh
clear

export PATH=~/.local/bin:~/.local/share/cargo/bin:$PATH

export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_CACHE_HOME=~/.cache

. $XDG_CONFIG_HOME/aliasrc

export HISTFILE=$XDG_DATA_HOME/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
bindkey -e

zstyle :compinstall filename ~/.zshrc

autoload -Uz compinit promptinit
compinit -d $XDG_DATA_HOME/zsh/zcompdump
zstyle ':completion:*' menu select
zmodload zsh/complist
promptinit
_com_option+=(globdots)
prompt walters

autoload -U colors && colors
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt AUTO_CD

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
export NVD_BACKEND=direct
export LP_PERF='no_mipmap,no_linear,no_mip_linear,no_tex,no_blend,no_depth,no_alphatest'

export MANGOHUD_CONFIG="cpu_temp,gpu_temp,ram,vram,"

export MOZ_DISABLE_RDD_SANDBOX=1

export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CRAWL_DIR="$XDG_DATA_HOME"/crawl/
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_HOME=/usr/lib/jvm/default
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export MBSYNCRC="$XDG_CONFIG_HOME"/isync/mbsyncrc
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PYTHONSTARTUP=/etc/python/pythonrc
export QT_QPA_PLATFORMTHEME=qt5ct
export RXVT_SOCKET="$XDG_DATA_HOME"/urxvt/urxvt-socket
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export WINEPREFIX="$XDG_DATA_HOME"/wine
export XCURSOR_PATH=/usr/share/icons:"$XDG_DATA_HOME"/icons

export GST_PLUGIN_FEATURE_RANK=nvmpegvideodec:MAX,nvmpeg2videodec:MAX,nvmpeg4videodec:MAX,nvh264sldec:MAX,nvh264dec:MAX,nvjpegdec:MAX,nvh265sldec:MAX,nvh265dec:MAX,nvvp9dec:MAX,avdec_av1:NONE,av1dec:NONE

PS1=' %F{5}>%f '

LFCD="$XDG_CONFIG_HOME"/lf/lfcd.sh
[ -f "$LFCD" ] || . "$LFCD"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec sx
fi
