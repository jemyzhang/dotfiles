#!/bin/bash -e

CURRENT_DIR=$(realpath $(dirname $(readlink -f ${BASH_SOURCE[0]:-$0})))

pushd $CURRENT_DIR > /dev/null 2>&1

# step 1: 基础工具 + pacman 镜像 (必须先于软件包安装，保证安装速度与稳定性)
echo
echo "Step 1/3: Install essential tools and optimize pacman mirrors?"
echo -n "Enter y/n and press Return: "
read input
if [ "$input" = y ] || [ "$input" = Y ]; then
    echo "Installing reflector ..."
    sudo pacman -S --needed --noconfirm reflector
    echo "Optimizing pacman mirrors ..."
    ./install-mirrors.sh pacman
    echo "Installing essential tools (base-devel git stow curl wget unzip) ..."
    sudo pacman -S --needed --noconfirm base-devel git stow curl wget unzip
    echo
    echo "Done."
    echo
else
    echo
    echo "Done (skipped the mirror/essential setup)."
    echo
fi

# backup
dotfile_backup_dir=$HOME/.dotfile.backup
echo "Backup old dotfiles to $dotfile_backup_dir"
pushd $HOME > /dev/null 2>&1
rm -rf $dotfile_backup_dir
mkdir -p $dotfile_backup_dir
for f in .gitignore_global .zshenv .zshrc .vimrc .tmux.conf .tmux.conf.local .config/nvim .config/zsh .config/kitty .config/starship.toml; do
    if [ -e $f -o -L $f ]; then
        mv $f $dotfile_backup_dir
    fi
done
popd > /dev/null 2>&1

# zsh: 安装 antidote 插件管理器
ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
mkdir -p "$ZDOTDIR"
if [ ! -d "$ZDOTDIR/.antidote" ]; then
    echo "Installing antidote ..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$ZDOTDIR/.antidote"
else
    echo "Antidote already installed, skipping..."
fi

# vi
echo "Installing plug(vim)..."
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tmux
echo "Setting up tmux term..."
tic -x $CURRENT_DIR/tmux-256color.terminfo

# git
echo "Applying git config..."
source $CURRENT_DIR/gitconfig.sh

# stow
echo "Setting up dotfiles ..."
stow git zsh nvim vim tmux -t $HOME -R
stow starship kitty -t $HOME/.config -R

# kitty: 在 kitty.conf 中引入 userprefs.conf
KITTY_CONF=$HOME/.config/kitty/kitty.conf
if [ ! -f "$KITTY_CONF" ] || ! grep -q '^include userprefs.conf' "$KITTY_CONF"; then
    echo "Appending 'include userprefs.conf' to $KITTY_CONF"
    echo "include userprefs.conf" >> "$KITTY_CONF"
fi

# step 2: 完整软件包
echo
echo "Step 2/3: Would you like to install essential packages?"
echo -n "Enter y/n and press Return: "
read input
if [ "$input" = y ] || [ "$input" = Y ]; then
    ./install-pkgs.sh
    echo
    echo "Done."
    echo
else
    echo
    echo "Done (skipped the package installation)."
    echo
fi


# step 3: 字体
echo
echo "Step 3/3: Would you like to install nerd fonts?"
echo -n "Enter y/n and press Return: "
read input
if [ "$input" = y ] || [ "$input" = Y ]; then
    ./install-fonts.sh
    echo
    echo "Done."
    echo
else
    echo
    echo "Done (skipped the nerd font installation)."
    echo
fi

popd > /dev/null 2>&1
