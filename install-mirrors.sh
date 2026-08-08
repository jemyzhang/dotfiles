#!/bin/bash -e

# ---------------------------------------------------------------------------
# Arch Linux 镜像设置
# Usage: install-mirrors.sh [pacman|tools|all]
#   pacman: 用 reflector 优化 pacman 镜像 (须在安装软件包前执行)
#   tools : 设置 pip/npm/docker 等语言及工具镜像 (须在安装完对应工具后执行)
#   all   : 全部 (默认)
# ---------------------------------------------------------------------------

MODE=${1:-all}

if [ "$MODE" = "pacman" ] || [ "$MODE" = "all" ]; then
    echo "Optimizing pacman mirrors with reflector ..."
    if command -v reflector >/dev/null 2>&1; then
        sudo reflector --country China --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
        sudo pacman -Syy
    else
        echo "reflector not installed, skipping pacman mirror optimization."
        echo "Install it with: sudo pacman -S reflector"
    fi
fi

if [ "$MODE" = "tools" ] || [ "$MODE" = "all" ]; then
    echo "Setting up pypi mirror ..."
    if command -v pip >/dev/null 2>&1; then
        pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
    fi

    echo "Setting up npm mirror ..."
    if command -v npm >/dev/null 2>&1; then
        npm config set registry https://registry.npmmirror.com
    fi

    echo "Setting up dockerhub mirror ..."
    if command -v docker >/dev/null 2>&1; then
        sudo mkdir -p /etc/docker
        if [ -f /etc/docker/daemon.json ]; then
            sudo cp /etc/docker/daemon.json /etc/docker/daemon.json.bak
        fi
        sudo tee /etc/docker/daemon.json > /dev/null <<'EOF'
{
  "registry-mirrors": [
    "https://docker.m.daocloud.io",
    "https://docker.1ms.run"
  ]
}
EOF
        sudo systemctl restart docker
    fi
fi

echo "Done."
