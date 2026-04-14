# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zmodload zsh/zprof
export EDITOR='vi'

# --- 历史记录配置 ---

# 必须指定 HISTFILE 的绝对路径
HISTFILE="$ZDOTDIR/.zsh_history"

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

# 初始化补全系统
autoload -Uz compinit && compinit

# 开启菜单选择：按两下 Tab 进入选择模式
zstyle ':completion:*' menu select

# 补全列表外观优化 (颜色随 LS_COLORS)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 分组显示补全结果
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

if [ -f ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh ]; then
  source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
  antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
fi

[ -f ${ZDOTDIR:-$HOME}/.fzf.zsh ] && source ${ZDOTDIR:-$HOME}/.fzf.zsh
[ -f ${ZDOTDIR:-$HOME}/.zshrc_export ] && source ${ZDOTDIR:-$HOME}/.zshrc_export
[ -f "${ZDOTDIR:-$HOME}/aliases.zsh" ] && source "${ZDOTDIR:-$HOME}/aliases.zsh"
[ -f "${ZDOTDIR:-$HOME}/keybinding.zsh" ] && source "${ZDOTDIR:-$HOME}/keybinding.zsh"

eval "$(zoxide init zsh)"

#zprof

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
