#!/bin/bash

# 获取脚本所在目录的绝对路径
CURDIR=$(cd $(dirname $0); pwd)

# 定义 Zsh 配置目录
ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# 1. 确保配置文件夹的父目录存在
mkdir -p $(dirname $ZDOTDIR)

# 2. 链接 .zshenv 到 $HOME (Zsh 启动的入口)
# -f: 强制覆盖, -r: 相对路径, -s: 符号链接
ln -sfr "$CURDIR/.zshenv" "$HOME/.zshenv"

# 3. 链接整个配置目录到 $ZDOTDIR
# -n: 如果目标是目录链接，则不进入目录，而是替换链接本身
ln -sfnr "$CURDIR" "$ZDOTDIR"

# 4. 自动化安装 Antidote
ANTIDOTE_DIR="$ZDOTDIR/.antidote"
if [ ! -d "$ANTIDOTE_DIR" ]; then
    echo "Cloning Antidote..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
else
    echo "Antidote already installed, skipping..."
fi

echo "Setup complete! Please restart your shell."

