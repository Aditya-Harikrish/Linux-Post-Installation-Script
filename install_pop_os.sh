#!/bin/bash
: '
Do not install the following through the command line:
- Discord
'

cd ~
sudo apt update
sudo apt upgrade -y

# Install apps
sudo apt install vlc telegram-desktop

# Install Brave
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# C/C++
sudo apt install clang clang-tidy

# Visual Studio Code
sudo apt install software-properties-common apt-transport-https
get -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

# MySQL
sudo apt install mysql-server -y

# Miscellaneous
sudo apt install tree htop tlp tlp-rdw lm-sensors python3-pip

# Python Libraries
python3 -m pip install PyMySQL
python3 -m pip install PyMySQL[rsa]

python -m pip install -U pip
python -m pip install -U matplotlib

pip install beautifulsoup4
pip3 install numpy

pip3 install pandas

# Aliases
if [[ $(grep -c 'Text added by me' ~/.bashrc) == 0 ]]; then
    printf -- "
# Text added by me:
source ~/.bash_aliases
" >>~/.bashrc
    printf -- "
alias python='python3.9'
alias python3='python3.9'
" >~/.bash_aliases
fi

sudo apt update
sudo apt upgrade -y
