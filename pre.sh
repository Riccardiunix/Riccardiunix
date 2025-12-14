#!/bin/sh
sudo pacman -S wmname bspwm sxhkd dmenu rxvt-unicode eza zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting lf btop neovim dash bat man-db xorg-xrdb xorg-xset xorg-mkfontscale terminus-font ttf-dejavu ttf-hack terminator pcmanfm trash-cli xorg-xrandr rust sccache base-devel xclip file-roller feh --noconfirm --needed || exit 1

mkdir -p ~/.local/share/zsh ~/Applications ~/.ssh/sockets
cp -r {.config,.local,.ssh} ~
cp .zshrc ~
cp .xinitrc  ~

cd /usr/share/fonts/misc
doas mkfontscale
doas mkfontdir

doas usermod -aG video,wheel,uucp,adm,disk,optical $(whoami)

chsh -s /bin/zsh

logout && exit
