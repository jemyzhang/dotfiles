#!/bin/bash -e

echo
echo "Would you like to install nerd font?"
echo -n "Enter y/n and press Return: "
read input
if [ "$input" = y ] || [ "$input" = Y ]; then
    sudo cp -af apt.sources.list.d/*.list /etc/apt/sources.list.d/
    #sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 56583E647FFA7DE7 # ubuntukylin
    #sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 331D6DDE7F8840CE # bcompare
    #sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7721F63BD38B4796 # google chrome
    #sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 55F96FCF8231B6DD # neovim
    #sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1655A0AB68576280 # nodejs
    sudo apt-key add *.gpg
fi

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update
sudo apt install -y nodejs yarn
sudo apt install -y stow
sudo apt install -y neovim zsh tmux git tig
sudo apt install -y meld ghex rclone
sudo apt install -y openssh-server openssh-sftp-server
sudo apt install -y autojump ripgrep silversearcher-ag exuberant-ctags
# docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io
# joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
