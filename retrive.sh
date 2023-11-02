#!/bin/sh
mkdir -p ~/.local/share/keepassxc/
rsync -aruPW server@10.0.0.9:~/Syncl/Passwords.kdbx ~/.local/share/keepassxc/
rsync -aruPW server@10.0.0.9:~/Syncl/urls ~/.config/newsboat/
