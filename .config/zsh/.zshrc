#!/bin/sh
export PATH=~/.local/bin:~/.local/share/cargo/bin:~/.local/share/go/bin:$PATH

export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

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

export GREP_COLORS='mt=1;32'

export EDITOR=nvim
export BROWSER=librewolf
export _BROWSER=firefox
export GUI_EDITOR=geany
export VISUAL=nvim
export TERMINAL=urxvtc
export _TERMINAL=terminator
export READER=zathura
export PAGER=most
export MANPAGER='most -s'
export SYSMONITOR=htop

#export LIBVA_DRIVER_NAME=
#export VDPAU_DRIVER=
#export NVD_BACKEND=direct
export VAAPI_MPEG4_ENABLED=true
export MESA_NO_DITHER=1
export MOZ_DRM_DEVICE=/dev/dri/card1
export mesa_glthread=true
export LP_PERF='no_mipmap,no_linear,no_mip_linear,no_tex,no_blend,no_depth,no_alphatest'

export MANGOHUD_CONFIG='cpu_temp,gpu_temp,ram,vram,'

export _JAVA_AWT_WM_NONREPARENTING=1
export USE_SYMENGINE=1
export QT_QPA_PLATFORMTHEME=qt5ct

#export __GL_THREADED_OPTIMIZATIONS=1
#export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
#export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

export ANDROID_HOME="$XDG_DATA_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CRAWL_DIR="$XDG_DATA_HOME"/crawl/
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export GDBHISTFILE="$XDG_CONFIG_HOME"/gdb/gdb_history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export MBSYNCRC="$XDG_CONFIG_HOME"/isync/mbsyncrc
export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PYTHONSTARTUP=/etc/python/pythonrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export RXVT_SOCKET="$XDG_DATA_HOME"/urxvt/urxvt-socket
export WINEPREFIX="$XDG_DATA_HOME"/wine
export XCURSOR_PATH=/usr/share/icons:"$XDG_DATA_HOME"/icons
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

PS1=' %F{5}>%f '
RPROMPT='%F{3}%1~%f'

. "$XDG_CONFIG_HOME"/lf/lfcd.sh

[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec sx
