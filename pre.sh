#!/bin/sh
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf &
sudo echo "permit keepenv persist orion" > /etc/doas.conf &
sudo sed -i -e 's/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q --threads=0 -)/g' /etc/makepkg.conf
sudo sed -i -e 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/g' /etc/makepkg.conf
sudo sed -i -e 's/COMPRESSGZ=(gzip -c -f -n)/COMPRESSGZ=(pigz-c -f -n)/g' /etc/makepkg.conf
sudo sed -i -e 's/COMPRESSBZ2=(bzip2 -c -f)/COMPRESSBZ2=(pbzip2 -c -f)/g' /etc/makepkg.conf

sudo pacman -S base-devel sscache bswpm sxhkd dmenu sx wmname cargo git rxvt-unicode zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting lf htop doas neovim dash bat man tlp ccache irqbalance thermald pigz pbzip2 firefox --needed -y

sudo systemctl enable --now irqbalance &
sudo systemctl enable --now thermald &
sudo systemctl enable --now tlp &
mkdir ~/.local/share/zsh

cp -r .config ~/.config
chsh -s /bin/zsh
