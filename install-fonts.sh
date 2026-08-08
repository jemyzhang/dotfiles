#!/bin/bash -e

# ---------------------------------------------------------------------------
# 通过 pacman 安装 Nerd Fonts 及中文字体
# ---------------------------------------------------------------------------

sudo pacman -S --needed --noconfirm \
    ttf-jetbrains-mono-nerd \
    ttf-ibm-plex \
    ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-mono \
    noto-fonts-cjk \
    noto-fonts-emoji

# 刷新字体缓存
fc-cache -f

echo "Done."
