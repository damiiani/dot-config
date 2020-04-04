# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$(yarn global bin):/snap/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/damiani/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

SPACESHIP_VI_MODE_NORMAL=‡
SPACESHIP_VI_MODE_INSERT=…

SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_DEFAULT_PREFIX="· "

SPACESHIP_CHAR_SYMBOL=●
SPACESHIP_CHAR_SUFFIX=" "

SPACESHIP_DIR_TRUNC=2
SPACESHIP_DIR_TRUNC_PREFIX=…/
SPACESHIP_DIR_COLOR=yellow

SPACESHIP_GIT_PREFIX="· "

SPACESHIP_PACKAGE_SHOW=false

SPACESHIP_NODE_SHOW=false

SPACESHIP_EXEC_TIME_SHOW=false
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    history-substring-search
    vi-mode
)

source $ZSH/oh-my-zsh.sh

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=none
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=none

bindkey -M vicmd 'j' vi-backward-char
bindkey -M vicmd 'l' history-substring-search-up
bindkey -M vicmd 'k' history-substring-search-down
bindkey -M vicmd 'ç' vi-forward-char

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

autoload -U zmv

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vi='nvim'
alias vim='nvim'

alias more='less'

# sudo alias
alias pacman='sudo pacman'

alias fdisk='sudo fdisk'

alias mount='sudo mount'
alias umount='sudo umount'

# trash can alias
alias rm='trash-put'
alias list='trash-list'
alias empty='trash-empty'
alias restore='trash-restore'

# Vim alias
alias q='exit'
alias :q='exit'

alias yay='yay --aur'

#xampp control panel
alias xampp='sudo /opt/lampp/manager-linux-x64.run'

# dot-config git repository alias
alias config='git --git-dir=$HOME/dot-config --work-tree=$HOME'

# clean fetch screen
AUX_PS1=$PS1
alias ufetch='PS1="" && clear && ufetch && PS1=$AUX_PS1'

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source /usr/share/doc/pkgfile/command-not-found.zsh

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting

clear
