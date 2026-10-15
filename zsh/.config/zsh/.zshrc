# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zmodload zsh/zprof
export EDITOR='vi'

# --- 历史记录配置 ---

# 历史记录写入 XDG state 目录，避免污染配置目录
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
mkdir -p "${HISTFILE:h}"

# 内存中保留的记录条数
HISTSIZE=10000
# 硬盘文件中保留的记录条数
SAVEHIST=10000

# --- 历史记录高级优化 (可选但推荐) ---

# 立即写入历史文件，而不是等到 shell 退出
setopt INC_APPEND_HISTORY
# 忽略重复的命令
setopt HIST_IGNORE_DUPS
# 忽略命令前后的空格
setopt HIST_IGNORE_SPACE
# 允许在多个终端会话之间共享历史记录
setopt SHARE_HISTORY
# 记录命令的开始时间和持续时间
setopt EXTENDED_HISTORY

# --- 补全样式 (须在 compinit 之前设置) ---
# 开启菜单选择：按两下 Tab 进入选择模式，上下键在候选间循环
zstyle ':completion:*' menu select

# 补全列表外观优化 (颜色随 LS_COLORS)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 分组显示补全结果
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# 模糊匹配: 大小写不敏感；前缀不命中时可匹配子串 (omz completion 库风格)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* *'

if [ -f ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh ]; then
  source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
  antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
fi

# 补全系统必须在插件之后初始化:
# zsh-completions 等插件先往 fpath 添加补全定义，之后 compinit 才能扫描注册
autoload -Uz compinit && compinit

# 在 $ZDOTDIR 中查找并 source，找不到则回退到 $HOME
# 用法: zsource <文件名>   （只传文件名，不带路径）
zsource() {
  local name=$1 f
  for f in "${ZDOTDIR:-$HOME}/$name" "$HOME/$name"; do
    [[ -f $f ]] || continue
    source "$f"
    break
  done
}

zsource .fzf.zsh
zsource .zshrc_export
zsource aliases.zsh
zsource keybinding.zsh

eval "$(zoxide init zsh)"

#zprof

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
