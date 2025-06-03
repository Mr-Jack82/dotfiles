# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Use LF to switch directories and bind it ctrl-o
lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [ -d "$dir" ]; then
			if [ "$dir" != "$(pwd)" ]; then
				cd "$dir"
			fi
		fi
	fi
}
bindkey -s '^o' 'lfcd\n'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	fasd
	zsh-peco-history
	sudo
	npm
	node
	fast-syntax-highlighting
	history-substring-search
	colored-man-pages
	zsh-autosuggestions
	zsh-vi-mode
	asdf
	tmuxinator)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=yellow"
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rm='rm -i'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=tty'
alias ls='ls --group-directories-first --color=tty'
alias l='eza --group-directories-first --almost-all'
alias ll='eza --group-directories-first --almost-all --long'
alias lt='eza --tree --level=2 --long --icons --git'
alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias ldir='ls -d */'
alias weather="http http://wttr.in/Temruk"
alias cp='cp -iv'
alias n=nvim
# for more info: https://youtu.be/JFr28K65-5E?t=4332
alias v='vim -c "let g:tty='\''$(tty)'\''"'
alias hx=helix
alias las='find . -maxdepth 1 -type l -printf "%p -> %l\n" | sort'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias c='clear'
# Thanks for Elijah Manor
alias nf='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'




# Set default editor to nvim
VISUAL='nvim' ; export VISUAL
EDITOR="$VISUAL" ; export EDITOR

# Use starship
eval "$(starship init zsh)"

# To activate zoxide
eval "$(zoxide init zsh)"

# Set path to asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# This trick works with VcXsrv under Windows Subsystem For Linux (WSL)
# to be able to copy/paste inside/outside Vim/Neovim
# TODO: need to find native WSL2 workround
export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0

# Init perlbrew
source ~/perl5/perlbrew/etc/bashrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Some option to better *history* usage
# https://zsh.sourceforge.io/Doc/Release/Options.html (16.2.4 History)
setopt EXTENDED_HISTORY  # Make entries in the history file in the format 1':start:elapsed;command'.
setopt INC_APPEND_HISTORY  # Write data to the history file immediately, not when the shell exit is performed.
setopt SHARE_HISTORY  # Use a common history repository in all sessions.
setopt HIST_IGNORE_DUPS  # Do not re-record the event you just recorded.
setopt HIST_IGNORE_ALL_DUPS  # Delete the old event record in case the new event is a duplicate of the old one.
setopt HIST_SAVE_NO_DUPS  # Do not write duplicate events to the history file.
setopt HIST_IGNORE_SPACE  # Do not make notes on command the begin with a space.
setopt HIST_VERIFY  # Before commands are executed, show notes about them from the command history.
setopt APPEND_HISTORY  # Add record to the history file (default).
setopt HIST_NO_STORE  # Do not keep records of *history* commands.
setopt HIST_REDUCE_BLANKS  # Remove extra spaces from command lines added to the history.
setopt HIST_FIND_NO_DUPS  # Do not display duplicates of a line previously found, even if the duplicates are not contiguous.

HISTSIZE=10000000
SAVEHIST=10000000
HISTDUP=erase

HISTORY_IGNORE="('ls' 'ls *' 'cd' 'cd *' 'pwd' 'exit')"

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
