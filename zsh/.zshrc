if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte-2.91.sh
fi

export EDITOR='vim'

## omz plugins
plugins=(
  colored-man-pages
  command-not-found
  fzf
  git
  history
  nvm
  sudo
  ubuntu
  zsh-autosuggestions
  zsh-navigation-tools
  fast-syntax-highlighting
)

export ZSH="$HOME/.oh-my-zsh"
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.zshrc_export ] && source $HOME/.zshrc_export
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## enable starship
eval "$(starship init zsh)"

