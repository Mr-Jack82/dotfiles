# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
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
HIST_STAMPS="mm/dd/yyyy"

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
    tmuxinator)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
# Color man pages. This method isn't work
# export MANPAGER="less -R --use-color -Dd+r -Du+b"

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cdi='cd `ls | peco`'
alias rm='rm -i'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=tty'
alias ls='ls --group-directories-first --color=tty'
alias l='eza --group-directories-first --almost-all'
alias ll='eza --group-directories-first --almost-all --long'
alias lt='eza --tree --level=2 --long --icons --git'
alias cf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ldir='ls -d */'
alias weather="http http://wttr.in/Temruk"
alias cp='cp -iv'
alias n=nvim
# for more info: https://youtu.be/JFr28K65-5E?t=4332
alias v='vim -c "let g:tty='\''$(tty)'\''"'
alias hx=helix
alias las='find . -maxdepth 1 -type l -printf "%p -> %l\n" | sort'
# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Using new Neovim feature (appears in neovim v0.9)
alias nvim-kick="NVIM_APPNAME=nvim_kickstart nvim"
# alias nvim-lazy="NVIM_APPNAME=nvim_lazy nvim"
# alias nvim-1chad="NVIM_APPNAME=nvchad_v1 nvim"
alias nvim-chad="NVIM_APPNAME=nvchad_v2 nvim"
alias nvim-heikemen="NVIM_APPNAME=nvim_heikemen nvim"
alias nvim-astra="NVIM_APPNAME=nvim_astra nvim"

# Config switcher
# https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b
function nvims() {
  items=("default" "nvim-kickstart" "nvim-lazy" "nvchad_v1" "nvchad_v2" "nvim_heikemen" "nvim_astra")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# Note that Ctrl key ('^') must be shielded in single quote
bindkey -s '^a' "nvims\n"

bindkey '^P' up-history
bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward

# Setting rg as the default source for fzf
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

# Making fzf a bit more user friendly
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview  "cat {}"'

# Apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

## FZF FUNCTIONS ##

# fo [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-o)
fo() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR: -vim} "${files[@]}"
}

# fh [FUZZY PATTERN] - Search in command history
fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fbr [FUZZY PATTERN] - Checkout specified branch
# Include remote branches, sorted by most recent commit and limited to 30
fgb() {
    local branches branch
    branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
    branch=$(echo "$branches" |
        fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# tm [SESSION_NAME | FUZZY PATTERN] - create new tmux session, or switch to existing one.
# Running 'tm' will let you fuzzy-find a session name
# Passing an argument to 'ftm' will switch to that session if it exists or create it otherwise
ftm() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ $1 ]; then
        tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
    fi
    session=$(tmux list-sessions -F "#{session)_name}" 2>/dev/null | fzf --exit-0) && tmux $change -t "$session" || echo "No sessions found."
}

# tm [SESSION_NAME | FUZZY PATTERN] - delete session
# Running 'tm' will let you fuzzy-find a session name to delete
# Passing an argument to 'ftm' will delete that session if it exists
ftmk() {
    if [ $1 ]; then
        tmux kill-session -t "$1"; return
    fi
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) && tmux kill-session -t "$session" || echo "No session to delete."
}

# fuzzy grep via rg and open in vim with line number
fgr() {
    local file
    local line

    read -r file line <<<"$(rg --no-heading --line-number $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

    if [[ -n $file ]]
    then
        vim $file +$line
    fi
}

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

# Prevent Neovim from nesting inside of the Terminal buffer
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  if [ -x "$(command -v nvr)" ]; then
    alias nvim=nvr
  else
    alias nvim='echo "No nesting\!"'
  fi
fi

# Set default editor to nvim
VISUAL='nvim' ; export VISUAL
EDITOR="$VISUAL" ; export EDITOR

# Enable true color support for terminals
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Use starship
eval "$(starship init zsh)"

# To activate zoxide
eval "$(zoxide init zsh)"

# Initialize asdf
. /opt/asdf-vm/asdf.sh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Some option to better *history* usage
# https://zsh.sourceforge.io/Doc/Release/Options.html (16.2.4 History)
setopt EXTENDED_HISTORY  # Make entries in the history file in the format 1':start:elapsed;command'.
setopt INC_APPEND_HISTORY  # Write data to the history file immediately, not when the shell exit is performed.
setopt SHARE_HISTORY  # Use a common history repository in all sessions.
setopt HIST_IGNORE_DUPS  # Do not re-record the event you just recorded.
setopt HIST_IGNORE_ALL_DUPS  # Delete the old event record in case the new event is a duplicate of the old one.
setopt HIST_SAVE_NO_DUPS  # Do not write duplicate events to the history file.
setopt HIST_IGNORE_SPACE  # Do not make notes on commands that begin with a space.
setopt HIST_VERIFY  # Before commands are executed, show notes about them from the command history.
setopt APPEND_HISTORY  # Add records to the history file (default).
setopt HIST_NO_STORE  # Do not keep records of *history* commands.
setopt HIST_REDUCE_BLANKS  # Remove extra spaces from command lines added to the history.

HISTSIZE=10000000
SAVEHIST=10000000

HISTORY_IGNORE="('ls' 'ls *' 'cd' 'cd *' 'pwd' 'exit')"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
