git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si || exit 1
cd ..

paru -S pavucontrol maim geany telegram-desktop signal-desktop zathura zathura-pdf-mupdf python-pip qbittorrent gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libde265 wget gst-plugin-pipewire gstreamer-vaapi adriconf lazygit mesa-utils p7zip mpv yt-dlp linux-tools devtools rsync newsboat lxsession thermalpowertop udisks2 bc librewolf-bin mullvad-browser-bin jellyfin-media-player redshift profile-sync-daemon-librewolf nsxiv github-cli thunderbird keepassxc mosh gnome-disk-utility arandr go clang prettyping plzip atool bleachbit lynx odt2txt mediainfo bat bleachbit tealdeer noto-fonts-emoji unicode-emoji pipewire-alsa pipewire-pulse xorg-xsetroot firefox cmake ninja libreoffice-fresh-it hunspell-it hyphen-it mythes-it tnftp pacman-contrib xorg-xev neovim-lspconfig pyright ccls pocl vim-airline cp-p deno typescript-language-server arch-audit bash-language-server gst-plugin-va inetutils mtools dosfstools rust-analyzer ttf-liberation xsel adobe-source-sans-fonts ttf-liberation peerflix fzf base91 symengine --noconfirm --needed || exit 1

xdg-mime default mullvad-browser.desktop x-scheme-handler/https x-scheme-handler/http text/html image/svg
xdg-mime default nemo.desktop inode/directory
xdg-mime default nsxiv.desktop image/jpeg image/png
xdg-mime default org.pwmt.zathura.desktop application/pdf

sudo systemctl enable paccache.timer

rm -rf ~/.bash* paru

systemctl --user enable --now psd.service

cd herbe
sed -i 's/width = 450/width = 190/g ; s/pos_y = 60/pos_y = 30/g' config.def.h
sudo make install || exit 1