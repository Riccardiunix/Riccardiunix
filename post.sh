#!/bin/sh
#export CARGO_HOME=/home/orion/.local/share/cargo
#export PATH=~/.local/bin:~/.local/share/cargo/bin:$PATH

sudo pacman -S pcmanfm geckodriver pavucontrol xsecurelock scrot geany telegram-desktop dino zathura zathura-pdf-mupdf mesa libva-mesa-driver mesa-vdpau pipx python python-pip arc-gtk-theme arc-icon-theme xorg-xrdb xss-lock redshift qbittorent ccache irqbalance thermald pigz pbzip2 --needed -y &

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S librewolf-bin jellyfin-media-player-git ananicy-cpp ananicy-rules-git noisetorch ff2mpv-native-messaging-host-librewolf-git profile-sync-daemon-librewolf universal-android-debloater -y

#cargo install cargo-update parallel-disk-usage 
