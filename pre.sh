#!/bin/sh
sudo pacman -S dunst most ccache wmname bspwm sxhkd dmenu rxvt-unicode eza zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting lf btop neovim bat man-db xorg-xrdb xorg-xset xorg-mkfontscale terminus-font ttf-dejavu ttf-hack terminator pcmanfm trash-cli xorg-xrandr rust sccache base-devel xclip file-roller feh --noconfirm --needed || exit 1

echo 'export ZDOTDIR=$HOME/.config/zsh' | sudo tee /etc/zsh/zshenv >/dev/null

mkdir -p ~/.local/share/zsh ~/.local/share/urxvt ~/.local/share/gnupg ~/.config/git ~/Applications ~/.ssh/sockets
cp -r {.config,.local,.ssh} ~
cp .xinitrc ~

cd /usr/share/fonts/misc
sudo mkfontscale
sudo mkfontdir

sudo usermod -aG video,wheel,uucp,adm,disk,optical $(whoami)

chsh -s /bin/zsh

logout && exit
