#!/bin/sh
printf '[device-mac-randomization]\nwifi.scan-rand-mac-address=yes\n[connection-mac-randomization]\nethernet.cloned-mac-address=random\nwifi.cloned-mac-address=random\n[connection]\nipv6.ip6-privacy=2' | sudo tee /etc/NetworkManager/conf.d/wifi_rand_mac.conf >/dev/null || exit 1
echo 'ACTION=="add", SUBSYSTEM=="net", KERNEL=="wl*", ATTR{mtu}="1500", ATTR{tx_queue_len}="2000"' | sudo tee /etc/udev/rules.d/10-network.rules >/dev/null &
printf "PKGEXT='.pkg.tar'\nPKGEXT='.pkg.tar.lz4'" | sudo tee -a /etc/makepkg.conf >/dev/null &
printf 'ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"\nACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="bfq"\nACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"' | sudo tee /etc/udev/rules.d/60-ioschedulers.rules >/dev/null &
sudo sed -i '/ParallelDownloads/s/^#//g ; /Color/s/^#//g' /etc/pacman.conf &
sudo sed -i '/BUILDDIR/s/^#//g ; /MAKEFLAGS=/s/^#//g ; s/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q --threads=0 -)/g ; s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/g ; s/"-march=x86-64/"-march=native/g ; s/#RUSTFLAGS="-C opt-level=2"/RUSTFLAGS="-C opt-level=2 -C target-cpu=native"/g' /etc/makepkg.conf &

echo -n "SSID: ";read SSID
[ -z $SSID ] || echo -n "PSW: ";read PSW;nmcli device wifi connect "$SSID" password "$PSW" hidden yes

sudo pacman -S pigz pbzip2 ccache --needed || exit 1

sudo sed -i 's/COMPRESSGZ=(gzip -c -f -n)/COMPRESSGZ=(pigz-c -f -n)/g ; s/COMPRESSBZ2=(bzip2 -c -f)/COMPRESSBZ2=(pbzip2 -c -f)/g ; s/!ccache/ccache/g' /etc/makepkg.conf

sudo pacman -S base-devel bspwm sxhkd dmenu sx wmname rxvt-unicode exa zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting lf htop doas neovim dash bat man tlp irqbalance thermald firefox xorg-xrdb xorg-xset xss-lock xsecurelock terminus-font ttf-dejavu ttf-hack terminator python-pipx xorg-mkfontscale ethtool smartmontools tlp-rdw powertop udisks2 --needed || exit 1

pipx install trash-cli || exit 1

echo 'permit keepenv persist orion' | sudo tee /etc/doas.conf > /dev/null &
echo 'export ZDOTDIR=$HOME/.config/zsh' | sudo tee /etc/zsh/zshenv > /dev/null&

sudo systemctl enable --now irqbalance
sudo systemctl enable --now thermald
sudo systemctl enable --now tlp &

mkdir -p ~/.local/share/zsh ~/.local/share/urxvt ~/.local/share/gnupg &
cp -r .config ~ &
cp -r .local ~ &
sudo cp 99-sysctl.conf /etc/sysctl.d/

sudo sysctl --system -q &

cd /usr/share/fonts/misc
sudo mkfontscale
sudo mkfontdir

chsh -s /bin/zsh

echo "Execute a 'logout' and re-login"
