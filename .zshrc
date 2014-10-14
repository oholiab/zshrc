# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fink"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gpg ssh git mosh bundler opp)

if ! ssh-add -l | grep -q RSA; then
  ssh-add
fi

source $ZSH/oh-my-zsh.sh


export PATH=$HOME/local/bin:$HOME/bin:/usr/local/bin:$PATH:/usr/local/sbin
export EDITOR=vim
export KEYTIMEOUT=1
setopt extendedglob

bindkey -v
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey "^?" backward-delete-char

if [ -n "$commands[scutil]" ]; then
  # OS X
  SHORT_HOST=$(scutil --get ComputerName)
else
	SHORT_HOST=${HOST/.*/}
fi

if [ $TERM = "rxvt-unicode-256color" ]; then
	export TERM='rxvt-unicode'
fi

alias ssh='ssh -A'
alias reload='source ~/.zshrc'
alias tweak='vim ~/.zshrc'
alias tmux='tmux -2'
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
