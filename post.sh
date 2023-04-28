#!/bin/sh
/bin/rm ~/.bash* &

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si || exit 1
cd .. &

sudo sed -i '/BottomUp/s/^#//g ; /\[bin\]/s/^#//g ; /Sudo = doas/s/^#//g' /etc/paru.conf

/bin/rm -rf paru &

paru -S wmname pcmanfm geckodriver pavucontrol scrot geany telegram-desktop dino zathura zathura-pdf-mupdf libva-mesa-driver mesa-vdpau python-pip arc-gtk-theme arc-icon-theme qbittorrent libva-vdpau-driver libvdpau-va-gl gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libde265 gst-plugin-pipewire gstreamer-vaapi adriconf lazygit mesa-utils p7zip mpv yt-dlp linux-tools devtools rsync newsboat lxsession ethtool tlp irqbalance thermald smartmontools tlp-rdw powertop udisks2 bc librewolf-bin jellyfin-media-player ananicy-cpp ananicy-rules-git noisetorch ff2mpv-native-messaging-host-librewolf-git profile-sync-daemon-librewolf herbe tlpui nsxiv asp github-cli --needed

sudo systemctl enable --now ananicy-cpp --quiet &
sudo systemctl enable --now irqbalance --quiet &
sudo systemctl enable --now thermald --quiet &
sudo systemctl enable --now tlp --quiet &

librewolf -CreateProfile "main /home/orion/.librewolf/main" &

git clone https://github.com/arkenfox/user.js

cp user.js/user.js ~/.librewolf/main &
cp user.js/prefsCleaner.sh ~/.librewolf/main &
cp user.js/updater.sh ~/.librewolf/main &
cp .mozilla/user-overrides.js ~/.librewolf/main
/bin/rm -rf user.js &

systemctl --user enable --now psd.service
