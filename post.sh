#!/bin/sh
sudo pacman -S rust pcmanfm sccache geckodriver cargo pavucontrol scrot geany telegram-desktop dino zathura zathura-pdf-mupdf libva-mesa-driver mesa-vdpau python-pip arc-gtk-theme arc-icon-theme qbittorrent libva-vdpau-driver libvdpau-va-gl gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libde265 gst-plugin-pipewire gstreamer-vaapi adriconf --needed

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

sudo sed -i '/BottomUp/s/^#//g
/\[bin\]/s/^#//g
/Sudo = doas/s/^#//g' /etc/paru.conf

paru -S librewolf-bin jellyfin-media-player ananicy-cpp ananicy-rules-git noisetorch ff2mpv-native-messaging-host-librewolf-git profile-sync-daemon-librewolf universal-android-debloater herbe

systemctl enable --now ananicy-cpp
systemctl --user enable --now psd.service

rm ~/.bash*
