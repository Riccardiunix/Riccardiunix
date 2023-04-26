#!/bin/sh
sudo sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf || exit 1
printf "PKGEXT='.pkg.tar'\nPKGEXT='.pkg.tar.lz4'" | sudo tee -a /etc/makepkg.conf > /dev/null
sudo sed -i '/BUILDDIR/s/^#//g
/MAKEFLAGS=/s/^#//g
s/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q --threads=0 -)/g
s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/g
s/"-march=x86-64/"-march=native/g
s/#RUSTFLAGS="-C opt-level=2"/RUSTFLAGS="-C opt-level=2 -C target-cpu=native"/g' /etc/makepkg.conf ||
exit 1

sudo pacman -S pigz pbzip2 ccache --needed || exit 1

sudo sed -i 's/COMPRESSGZ=(gzip -c -f -n)/COMPRESSGZ=(pigz-c -f -n)/g
s/COMPRESSBZ2=(bzip2 -c -f)/COMPRESSBZ2=(pbzip2 -c -f)/g
s/!ccache/ccache/g' /etc/makepkg.conf

sudo pacman -S base-devel bspwm sxhkd dmenu sx wmname rxvt-unicode exa zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting lf htop doas neovim dash bat man tlp irqbalance thermald firefox xorg-xrdb xorg-xset xss-lock xsecurelock terminus-font ttf-dejavu terminator python-pipx xorg-mkfontscale --needed || exit 1

pipx install trash-cli || exit 1

sudo systemctl enable --now irqbalance
sudo systemctl enable --now thermald
sudo systemctl enable --now tlp

mkdir -p ~/.local/share/zsh ~/.local/share/urxvt ~/.local/share/gnupg ~/.config/zsh &
cp -r .config ~ &
cp -r .local ~ &
cp .Xdefaults ~/.config/Xdefaults &
cp .zshrc ~/.config/zsh
chsh -s /bin/zsh

echo 'permit keepenv persist orion' | sudo tee /etc/doas.conf > /dev/null
echo 'ACTION=="add", SUBSYSTEM=="net", KERNEL=="wl*", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000"' | sudo tee /etc/udev/rules.d/10-network.rules > /dev/null
echo '''ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
ACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="bfq"
ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none" ''' | sudo tee /etc/udev/rules.d/60-ioschedulers.rules > /dev/null

#sudo mkdir/etc/zsh
echo "export ZDOTDIR=$HOME/.config/zsh" | sudo tee /etc/zsh/zshenv > /dev/null

sudo cp 99-sysctl.conf /etc/sysctl.d/
sudo sysctl --system

cd /usr/share/fonts/misc
sudo mkfontscale
sudo mkfontdir

echo "Execute a 'logout' and re-login"
