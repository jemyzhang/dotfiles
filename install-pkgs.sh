#!/bin/bash -e

# ---------------------------------------------------------------------------
# Arch Linux package installation
# 包列表来自历史安装记录 (pacman.log)，剔除了已卸载的包
# 注意: pacman 镜像优化 (install-mirrors.sh pacman) 由 install.sh 在调用本脚本前执行
# ---------------------------------------------------------------------------

# ---- 官方仓库软件包 ----
packages=(
  # 系统基础
  base-devel reflector
  power-profiles-daemon upower zram-generator

  # 网络
  networkmanager openssh tailscale

  # 音频
  pipewire pipewire-pulse wireplumber alsa-utils

  # 开发 / 工具
  git stow curl wget unzip
  zsh tmux starship
  neovim vim
  tig htop less
  ripgrep fd fzf bat eza zoxide duf dust
  universal-ctags ghex
  python python-pip nodejs npm

  # Wayland 桌面
  niri quickshell dms-shell dgop greetd
  xwayland-satellite xdg-desktop-portal-gtk

  # 输入法
  fcitx5 fcitx5-chinese-addons fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-rime rime-emoji

  # 文件管理 / 媒体
  thunar thunar-archive-plugin thunar-volman tumbler ffmpegthumbnailer
  mpv mplayer

  # 硬件 / 外设
  keyd matugen intel-media-driver libva-utils sof-firmware
  bluez bluez-utils evtest

  # 字体
  ttf-jetbrains-mono-nerd ttf-ibm-plex ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono
  noto-fonts-cjk noto-fonts-emoji

  # 终端 / AI
  kitty fastfetch opencode
)

echo "Installing core packages via pacman..."
sudo pacman -S --needed --noconfirm "${packages[@]}"

# 语言/工具镜像 (pip/npm/docker 此时已安装)
./install-mirrors.sh tools

# yarn (官方仓库没有，通过 npm 安装)
if command -v npm >/dev/null 2>&1; then
    echo "Installing yarn via npm ..."
    npm install -g yarn
fi

# ---------------------------------------------------------------------------
# AUR 软件包 (需要 yay)
# ---------------------------------------------------------------------------
echo
echo "Would you like to install AUR packages (google-chrome mihomo-bin wiliwili ...)?"
echo -n "Enter y/n and press Return: "
read input
if [ "$input" = y ] || [ "$input" = Y ]; then
    if ! command -v yay >/dev/null 2>&1; then
        echo "Installing yay ..."
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        pushd /tmp/yay > /dev/null 2>&1
        makepkg -si --noconfirm
        popd > /dev/null 2>&1
        rm -rf /tmp/yay
    fi
    yay -S --needed --noconfirm \
        google-chrome \
        yay-bin \
        mihomo-bin \
        dankcalendar-bin \
        dsearch-bin \
        iloader-bin \
        piliplus-bin \
        zennotes-bin \
        greetd-dms-greeter-bin
fi

echo "Done."
