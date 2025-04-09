# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme - powerlevel10k is recommended but requires installation
ZSH_THEME="powerlevel10k/powerlevel10k"  # Default powerful theme, change to "powerlevel10k/powerlevel10k" if installed

# Set plugins
plugins=(
  git                # Git integration and aliases
  zsh-autosuggestions    # Fish-like autosuggestions
  zsh-syntax-highlighting # Syntax highlighting while typing
  history            # Enhanced history utility
  sudo               # Press ESC twice to add sudo to current command
  copypath           # Copy current directory path to clipboard
  dirhistory         # Alt+Left/Right to navigate directory history
  web-search         # Search from terminal (e.g., google "query")
  fzf                # Fuzzy finder integration
  docker             # Docker completions and aliases
  extract            # Extract any archive with 'x' command
  colored-man-pages  # Colorized man pages
  command-not-found  # Suggests packages when command not found
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'  # Change to your preferred editor
fi

# Set ls colors
export LS_COLORS="di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=1;30;41:sg=1;30;46:tw=1;30;42:ow=1;30;43"

# Enhanced history settings
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # Record command start time
setopt hist_expire_dups_first # Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # Ignore duplicated commands
setopt hist_ignore_space      # Ignore commands that start with space
setopt hist_verify            # Show command before executing history substitution
setopt inc_append_history     # Add commands to HISTFILE in order of execution
setopt share_history          # Share command history data

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Enhanced ls commands
alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias glg='git log --graph --oneline --decorate'

# System shortcuts
alias sz='source ~/.zshrc'
alias ez='$EDITOR ~/.zshrc'
alias update='sudo apt update && sudo apt upgrade'  # Change based on your distro

# FZF integration - powerful command-line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Better directory listings with exa (if installed)
if command -v exa &> /dev/null; then
  alias ls='exa'
  alias ll='exa -la --git --icons'
  alias lt='exa -T --icons --git-ignore'
  alias lta='exa -Ta --icons'
fi

# Better cat with bat (if installed)
if command -v bat &> /dev/null; then
  alias cat='bat'
fi

# Add zsh-autosuggestions and zsh-syntax-highlighting (install these separately)
# These must be at the end of .zshrc
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

alias drun='sudo docker run -it --network=host --device=/dev/kfd --device=/dev/dri --group-add=video --ipc=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --shm-size 8G -v $HOME/dockerx:/dockerx -w /dockerx'

# bun completions
[ -s "/home/fabio/.bun/_bun" ] && source "/home/fabio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export QSYS_ROOTDIR="/home/fabio/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/24.1/quartus/sopc_builder/bin"

# Qt Themes
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=fusion
export QT_QPA_PLATFORMTHEME=qt6ct
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "/home/fabio/.jabba/jabba.sh" ] && source "/home/fabio/.jabba/jabba.sh"
alias dotfiles='git --git-dir=/home/fabio/.dotfiles/ --work-tree=/home/fabio'
