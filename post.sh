#!/bin/sh
sudo pacman -S rustup pcmanfm sscache geckodriver cargo pavucontrol scrot geany telegram-desktop dino zathura zathura-pdf-mupdf mesa libva-mesa-driver mesa-vdpau python-pip arc-gtk-theme arc-icon-theme qbittorrent --needed

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S librewolf-bin jellyfin-media-player ananicy-cpp ananicy-rules-git noisetorch ff2mpv-native-messaging-host-librewolf-git profile-sync-daemon-librewolf universal-android-debloater

systemctl enable --now ananicy-cpp

#cargo install cargo-update parallel-disk-usage 
