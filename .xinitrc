#!/bin/sh
export PATH=~/.local/bin:~/.local/share/cargo/bin:~/.local/share/go/bin:$PATH

export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

export HISTFILE=$XDG_DATA_HOME/zsh/histfile

export GREP_COLORS='mt=1;32'

export EDITOR=nvim
export BROWSER=mullvad-browser
export _BROWSER=librewolf
export GUI_EDITOR=geany
export VISUAL=nvim
export TERMINAL=urxvtc
export _TERMINAL=terminator
export READER=zathura
export PAGER=most
export MANPAGER='nvim +Man!'
export SYSMONITOR=btop

#export LIBVA_DRIVER_NAME=
#export VDPAU_DRIVER=
#export NVD_BACKEND=direct
#export GBM_BACKEND=nvidia-drm
export VAAPI_MPEG4_ENABLED=true
export MESA_NO_DITHER=1
export MOZ_DRM_DEVICE=/dev/dri/card1
export mesa_glthread=true
export LP_PERF='no_mipmap,no_linear,no_mip_linear,no_tex,no_blend,no_depth,no_alphatest'
#export GST_PLUGIN_FEATURE_RANK=nvmpegvideodec:MAX,nvmpeg2videodec:MAX,nvmpeg4videodec:MAX,nvh264sldec:MAX,nvh264dec:MAX,nvjpegdec:MAX,nvh265sldec:MAX,nvh265dec:MAX,nvvp9dec:MAX,avdec_av1:NONE,av1dec:NONE

#export MANGOHUD_CONFIG='cpu_temp,gpu_temp,ram,vram,'
#export WINE_FULLSCREEN_FSR=1
#export PROTON_ENABLE_NVAPI=1

export _JAVA_AWT_WM_NONREPARENTING=1
export USE_SYMENGINE=1
export QT_QPA_PLATFORMTHEME=qt5ct

#export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
#export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

#rm -rf ~/.gtkrc-2.0 ~/.icons ~/.npm ~/.python_history ~/.wget-hsts ~/.yarnrc ~/.yarn ~/.electron-gyp ~/.xonotic/lock ~/.net ~/.local/share/go/pkg/mod &
xrdb ~/.config/Xdefaults
urxvtd -q -o -f
xset b off
xset r rate 200 50
xset s off
#xidlehook --detect-sleep --not-when-audio --not-when-fullscreen --timer 180 'xsecurelock' '' --timer 420 'systemctl sleep' '' &
#xss-lock xsecurelock &
redshift &
lxpolkit -s bspwm -e bspwm &
bspwm
