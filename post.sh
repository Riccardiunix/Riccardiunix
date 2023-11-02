#!/bin/sh
sudo mkdir /etc/python/ 
sudo cp pythonrc /etc/python

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si || exit 1
cd ..

sudo sed -i '/BottomUp/s/^#//g ; /\[bin\]/s/^#//g ; /Sudo = doas/s/^#//g' /etc/paru.conf

paru -S wmname geckodriver pavucontrol scrot geany telegram-desktop signal-desktop zathura zathura-pdf-mupdf libva-mesa-driver mesa-vdpau python-pip arc-gtk-theme arc-icon-theme qbittorrent libva-vdpau-driver libvdpau-va-gl gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libde265 wget gst-plugin-pipewire gstreamer-vaapi adriconf lazygit mesa-utils p7zip mpv yt-dlp linux-tools devtools rsync newsboat lxsession ethtool tlp irqbalance thermald smartmontools tlp-rdw powertop udisks2 bc librewolf-bin jellyfin-media-player ananicy-rules-git noisetorch xsecurelock redshift ff2mpv-native-messaging-host-librewolf-git profile-sync-daemon-librewolf tlpui nsxiv asp github-cli thunderbird gamemode keepassxc mosh gnome-disk-utility arandr go clang prettyping plzip atool bleachbit lynx odt2txt mediainfo bat asp bleachbit tldr xidlehook noto-fonts-emoji mpd mpc ncmpcpp pipewire-alsa pipewire-pulse xorg-xsetroot xss-lock firefox cmake ninja ananicy-cpp most libreoffice-fresh-it hunspell-it hyphen-it mythes-it tnftp pacman-contrib xorg-xev neovim-lspconfig pyright ccls pocl vim-airline cp-p deno typescript-language-server arch-audit --noconfirm --needed || exit 1

xdg-mime default librewolf.desktop x-scheme-handler/https x-scheme-handler/http

sudo chmod go-r /boot /etc/nftables.conf /etc/iptables

sudo sed -i 's/Logo=1/Logo=0/g' /etc/libreoffice/sofficerc
sudo sed -i 's/COMPRESSLZ=(lzip -c -f)/COMPRESSLZ=(plzip -c -f)/g' /etc/makepkg.conf

sudo systemctl enable --now ananicy-cpp irqbalance thermald tlp
sudo systemctl enable paccache.timer

librewolf -CreateProfile "main /home/orion/.librewolf/main"

git clone https://github.com/arkenfox/user.js
cp {user.js/user.js , user.js/prefsCleaner.sh , user.js/updater.sh , .mozilla/user-overrides.js} ~/.librewolf/main/
rm -rf user.js ~/.bash* paru

cd ~/.librewolf/main
./prefsCleaner.sh
./updater.sh

sudo rm /usr/lib/librewolf/crashreporter /usr/lib/librewolf/minidump-analyzer /usr/lib/librewolf/pingsender /usr/lib/firefox/crashreporter /usr/lib/firefox/minidump-analyzer /usr/lib/firefox/pingsender

systemctl --user enable --now psd.service

cd ~/Applications
git clone https://github.com/dudik/herbe
cd herbe
sed -i 's/width = 450/width = 190/g ; s/pos_y = 60/pos_y = 30/g' config.def.h
sudo make install || exit 1

setsid -f librewolf about:profiles https://addons.mozilla.org/en-US/firefox/addon/ff2mpv/ https://addons.mozilla.org/en-US/firefox/addon/darkreader/ https://addons.mozilla.org/en-US/firefox/addon/libredirect/ https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/ https://addons.mozilla.org/en-US/firefox/addon/skip-redirect/ https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/ https://addons.mozilla.org/en-US/firefox/addon/stack-overflow-prettifier/ -P main > /dev/null 2>&1
