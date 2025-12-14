#!/bin/sh
doas pacman -S wmname bspwm sxhkd dmenu sx rxvt-unicode eza zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting lf btop neovim dash bat man-db xorg-xrdb xorg-xset xorg-mkfontscale terminus-font ttf-dejavu ttf-hack terminator pcmanfm trash-cli xorg-xrandr rust sccache base-devel xclip file-roller acpilight feh --noconfirm --needed

#echo 'export ZDOTDIR=$HOME/.config/zsh' | doas tee /etc/zsh/zshenv >/dev/null

mkdir -p ~/.local/share/zsh ~/Applications ~/.ssh/sockets
cp -r {.config,.local,.ssh} ~
cp .zshrc ~

cd /usr/share/fonts/misc
doas mkfontscale
doas mkfontdir

doas usermod -aG video,wheel,uucp,adm,disk,optical $(whoami)

chsh -s /bin/zsh

logout && exit