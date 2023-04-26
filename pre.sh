#!/bin/sh
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf || exit 1
sudo sed -i '/BUILDDIR/s/^#//g' /etc/pacman.conf || exit 1
echo "permit keepenv persist orion" | sudo tee /etc/doas.conf
sudo sed -i -e 's/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q --threads=0 -)/g' /etc/makepkg.conf
sudo sed -i -e 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/g' /etc/makepkg.conf

sudo pacman -S pigz pbzip2 ccache--needed || exit 1

sudo sed -i -e 's/COMPRESSGZ=(gzip -c -f -n)/COMPRESSGZ=(pigz-c -f -n)/g' /etc/makepkg.conf
sudo sed -i -e 's/COMPRESSBZ2=(bzip2 -c -f)/COMPRESSBZ2=(pbzip2 -c -f)/g' /etc/makepkg.conf
sudo sed -i -e 's/!ccache/ccache/g' /etc/makepkg.conf

sudo pacman -S base-devel bspwm sxhkd dmenu sx wmname rxvt-unicode exa zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting lf htop doas neovim dash bat man tlp irqbalance thermald firefox xorg-xrdb xorg-xset xss-lock xsecurelock terminus-font ttf-dejavu terminator python-pipx xorg-mkfontscale --needed || exit 1

pipx install trash-cli || exit 1

sudo systemctl enable --now irqbalance &
sudo systemctl enable --now thermald &
sudo systemctl enable --now tlp &

cd /usr/share/fonts/misc
sudo mkfontscale
sudo mkfontdir

mkdir -p ~/.local/share/zsh ~/.local/share/urxvt ~/.local/share/gnupg
cp -r .config ~/.config
cp -r .local ~/.local
cp .Xdefaults ~/.config/Xdefaults
cp .zshrc ~
chsh -s /bin/zsh

echo '''ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
ACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="bfq"
ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none" ''' | sudo tee /etc/udev/rules.d/60-ioschedulers.rules

logout
