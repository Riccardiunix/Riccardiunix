#!/bin/sh
/bin/rm ~/.bash* &
sudo pacman -S rust pcmanfm sccache geckodriver cargo pavucontrol scrot geany telegram-desktop dino zathura zathura-pdf-mupdf libva-mesa-driver mesa-vdpau python-pip arc-gtk-theme arc-icon-theme qbittorrent libva-vdpau-driver libvdpau-va-gl gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libde265 gst-plugin-pipewire gstreamer-vaapi adriconf lazygit mesa-utils p7zip mpv yt-dlp linux-tools fzf devtools rsync newsboat lxsession --needed

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si || exit 1
cd .. &

sudo sed -i '/BottomUp/s/^#//g ; /\[bin\]/s/^#//g ; /Sudo = doas/s/^#//g' /etc/paru.conf

/bin/rm -rf paru &

paru -S librewolf-bin jellyfin-media-player ananicy-cpp ananicy-rules-git noisetorch ff2mpv-native-messaging-host-librewolf-git profile-sync-daemon-librewolf herbe tlpui nsxiv asp --needed

setsid -f librewolf > /dev/null &
systemctl enable --now ananicy-cpp

git clone https://github.com/arkenfox/user.js

killall -q librewolf

LIBREWOLF_DIR=$(ls -d ~/.librewolf/*/ | fzf)

cp user.js/user.js $LIBREWOLF_DIR &
cp user.js/prefsCleaner.sh $LIBREWOLF_DIR &
cp user.js/updater.sh $LIBREWOLF_DIR &
cp .mozilla/user-overrides.js $LIBREWOLF_DIR
/bin/rm -rf user.js &

systemctl --user enable --now psd.service

sudo powertop --calibrate
