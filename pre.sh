#!/bin/sh
sudo sed -i 's/#SHA_CRYPT_MIN_ROUNDS 5000/SHA_CRYPT_MIN_ROUNDS 10000/g ; s/#SHA_CRYPT_MAX_ROUNDS 5000/SHA_CRYPT_MAX_ROUNDS 10000/g ; s/UMASK        022/UMASK 027/g' /etc/login.defs || exit 1
printf "* hard core 0\n* soft core 0" | sudo tee -a /etc/security/limits.conf >/dev/null
printf "[device-mac-randomization]\nwifi.scan-rand-mac-address=yes\n[connection-mac-randomization]\nethernet.cloned-mac-address=random\nwifi.cloned-mac-address=random\n[connection]\nipv6.ip6-privacy=2" | sudo tee /etc/NetworkManager/conf.d/wifi_rand_mac.conf >/dev/null
echo 'ACTION=="add",SUBSYSTEM=="net",KERNEL=="wl*",ATTR{mtu}="1500",ATTR{tx_queue_len}="2000"' | sudo tee /etc/udev/rules.d/10-network.rules >/dev/null
printf "ACTION=='add|change',KERNEL=='sd[a-z]*',ATTR{queue/rotational}=='1',ATTR{queue/scheduler}='bfq'\nACTION=='add|change',KERNEL=='sd[a-z]*|mmcblk[0-9]*',ATTR{queue/rotational}=='0',ATTR{queue/scheduler}='bfq'\nACTION=='add|change',KERNEL=='nvme[0-9]*',ATTR{queue/rotational}=='0',ATTR{queue/scheduler}='none'" | sudo tee /etc/udev/rules.d/60-ioschedulers.rules >/dev/null
printf "SUBSYSTEM=='power_supply',ATTR{status}=='Discharging',ATTR{capacity}=='[0-1]',RUN+='/usr/bin/systemctl hibernate'\nSUBSYSTEM=='power_supply',ATTR{status}=='Discharging', ATTR{capacity}=='[0-5]',RUN+='/bin/xbacklight -set 0'" | sudo tee /etc/udev/rules.d/99-lowbat.rules >/dev/null
printf "PKGEXT='.pkg.tar'\nPKGEXT='.pkg.tar.lz4'\nGITFLAGS='--filter=tree:0'" | sudo tee -a /etc/makepkg.conf >/dev/null
printf "blacklist firewire-core\nblacklist firewire-net\nblacklist firewire-ohci\nblacklist firewire-sbp2" | sudo tee /etc/modprobe.d/blacklist.conf >/dev/null
printf "install dccp /bin/true\ninstall sctp /bin/true\ninstall rds /bin/true\ninstall tipc /bin/true" | sudo tee /etc/modprobe.d/netblock.conf >/dev/null
sudo sed -i '/ParallelDownloads/s/^#//g ; /Color/s/^#//g' /etc/pacman.conf
sudo sed -i '/BUILDDIR/s/^#//g ; /MAKEFLAGS=/s/^#//g ; s/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q --threads=0 -)/g ; s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/g ; s/"-march=x86-64/"-march=native/g' /etc/makepkg.conf

curl https://big.oisd.nl/hosts > hosts
mv hosts /etc/hosts
read HNAME < /etc/hostname
printf "\n\n127.0.0.1 localhost\n127.0.1.1 $HNAME.lan $HNAME" | sudo tee -a /etc/hosts >/dev/null

sudo pacman -S pigz pbzip2 ccache mold doas --noconfirm --needed || exit 1

echo "permit keepenv persist $(whoami)" | sudo tee /etc/doas.conf >/dev/null
doas ln -sf /bin/doas /usr/local/bin/sudo

doas sed -i 's/COMPRESSGZ=(gzip -c -f -n)/COMPRESSGZ=(pigz-c -f -n)/g ; s/COMPRESSBZ2=(bzip2 -c -f)/COMPRESSBZ2=(pbzip2 -c -f)/g ; s/!ccache/ccache/g ; s/#RUSTFLAGS="-C opt-level=2"/RUSTFLAGS="-C opt-level=2 -C target-cpu=native -C link-arg=-fuse-ld=mold"/g ; s/LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"/LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -fuse-ld=mold"/g' /etc/makepkg.conf

doas pacman -S bspwm sxhkd dmenu sx rxvt-unicode eza zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting lf htop neovim dash bat man-db xorg-xrdb xorg-xset xorg-mkfontscale terminus-font ttf-dejavu ttf-hack terminator pcmanfm trash-cli xorg-xrandr rust sccache base-devel xclip file-roller acpilight feh --noconfirm --needed || exit 1

echo 'export ZDOTDIR=$HOME/.config/zsh' | doas tee /etc/zsh/zshenv >/dev/null

mkdir -p ~/.local/share/zsh ~/.local/share/urxvt ~/.local/share/gnupg ~/.config/git ~/Applications ~/.local/share/android ~/.local/state/mpd ~/.ssh/sockets
cp -r {.config,.local,.ssh} ~
doas cp 99-sysctl.conf /etc/sysctl.d/

doas sysctl --system -q

cd /usr/share/fonts/misc
doas mkfontscale
doas mkfontdir

doas usermod -aG video,wheel,uucp,adm,disk,optical $(whoami)

chsh -s /bin/zsh

logout
