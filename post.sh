#!/bin/sh
mkdir -p ~/.config/python ~/.config/pipewire/pipewire.conf.d/
cp pythonrc ~/.config/python
cp 99-input-denoising.conf ~/.config/pipewire/pipewire.conf.d/

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si || exit 1
cd ..

sudo sed -i '/BottomUp/s/^#//g ; /\[bin\]/s/^#//g ; /Sudo = doas/s/^#//g' /etc/paru.conf

paru -S wmname geckodriver pavucontrol maim geany telegram-desktop signal-desktop acpid zathura zathura-pdf-mupdf libva-mesa-driver mesa-vdpau python-pip arc-gtk-theme arc-icon-theme qbittorrent libva-vdpau-driver libvdpau-va-gl gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libde265 wget gst-plugin-pipewire gstreamer-vaapi adriconf lazygit mesa-utils p7zip mpv yt-dlp linux-tools devtools rsync newsboat lxsession ethtool tlp thermald smartmontools tlp-rdw powertop udisks2 bc librewolf-bin jellyfin-media-player xsecurelock redshift ff2mpv-native-messaging-host-librewolf-git profile-sync-daemon-librewolf tlpui nsxiv github-cli thunderbird gamemode keepassxc mosh gnome-disk-utility arandr go clang prettyping plzip atool bleachbit lynx odt2txt mediainfo bat bleachbit tealdeer xidlehook noto-fonts-emoji unicode-emoji mpd mpc ncmpcpp pipewire-alsa pipewire-pulse xorg-xsetroot xss-lock firefox cmake ninja libreoffice-fresh-it hunspell-it hyphen-it mythes-it tnftp pacman-contrib xorg-xev neovim-lspconfig pyright ccls pocl vim-airline cp-p deno typescript-language-server arch-audit bash-language-server gst-plugin-va inetutils mtools dosfstools rust-analyzer noise-suppression-for-voice ttf-liberation xsel adobe-source-sans-fonts ttf-liberation peerflix fzf base91 spotube-bin --noconfirm --needed || exit 1

xdg-mime default librewolf.desktop x-scheme-handler/https x-scheme-handler/http text/html image/svg
xdg-mime default pcmanfm.desktop inode/directory
xdg-mime default nsxiv.desktop image/jpeg image/png
xdg-mime default org.pwmt.zathura.desktop application/pdf

sudo chmod go-r /boot /etc/nftables.conf /etc/iptables

sudo sed -i 's/Logo=1/Logo=0/g' /etc/libreoffice/sofficerc
sudo sed -i 's/COMPRESSLZ=(lzip -c -f)/COMPRESSLZ=(plzip -c -f)/g' /etc/makepkg.conf

sudo systemctl restart --user pipewire.service
sudo systemctl enable --now thermald tlp acpid
sudo systemctl enable paccache.timer
sudo systemctl disable --now NetworkManager-dispatcher.service NetworkManager-wait-online.service

librewolf -CreateProfile "main /home/$(whoami)/.librewolf/main"

cp -r .mozilla/ ~/.librewolf/main/
rm -rf ~/.bash* paru

cd ~/.librewolf/main
./prefsCleaner.sh
./updater.sh

sudo rm /usr/lib/librewolf/crashreporter /usr/lib/librewolf/minidump-analyzer /usr/lib/librewolf/pingsender /usr/lib/firefox/crashreporter /usr/lib/firefox/minidump-analyzer /usr/lib/firefox/pingsender /usr/lib/firefox/browser/features/screenshots@mozilla.org.xpi

systemctl --user enable --now psd.service

cd ~/Applications
git clone https://github.com/dudik/herbe
cd herbe
sed -i 's/width = 450/width = 190/g ; s/pos_y = 60/pos_y = 30/g' config.def.h
sudo make install || exit 1

setsid -f librewolf https://addons.mozilla.org/en-US/firefox/addon/sidebery /about:profiles https://addons.mozilla.org/en-US/firefox/addon/ff2mpv/ https://addons.mozilla.org/en-US/firefox/addon/darkreader/ https://addons.mozilla.org/en-US/firefox/addon/libredirect/ https://addons.mozilla.org/en-US/firefox/addon/skip-redirect/ https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/ https://addons.mozilla.org/en-US/firefox/addon/requestcontrol/ https://addons.mozilla.org/en-US/firefox/addon/behave https://addons.mozilla.org/it/firefox/addon/temporary-containers/ -P main > /dev/null 2>&1
