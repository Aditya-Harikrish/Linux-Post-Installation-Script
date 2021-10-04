#!/bin/bash
: '
Do not install the following through the command line:
- Discord
'
# This shell script is for Arch-based distros only

# Arch's equivalent of `apt-get update && apt-get upgrade`
sudo pacman -Syu

# Paru
mkdir -p ~/packages
cd ~/packages
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~

# Install flatpak
sudo pamac install flatpak libpamac-flatpak-plugin

# Programming Tools:
sudo paru -S code python-pip

# Install programming tools
sudo pacman -S clang-12 clang-tidy-12 valgrind python3.9

# Miscellaneous
suod pacman -S htop

# Install apps
sudo pacman -S vlc telegram-desktop

# Aliases
if [[ $(grep -c 'Text added by me' ~/.bashrc) == 0 ]]; then
    printf -- "
# Text added by me:
source ~/.bash_aliases
" >>~/.bashrc
    printf -- "
alias python='python3.9'
alias python3='python3.9'
alias clang='clang-12'
alias clang-tidy='clang-tidy-12'
" >~/.bash_aliases
fi
