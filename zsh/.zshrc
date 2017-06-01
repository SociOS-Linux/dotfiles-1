# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

PATH="$HOME/bin:$HOME/apoe4it/bin:$PATH:."
XENVIRONMENT=$HOME/.Xdefaults-$(choose-xdefaults)
export XENVIRONMENT

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/marc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Custom zle config -MR

# This section maps the ESC-/ chord to vi search rather than _history-complete-older,
# and it sets the initial cursor position after searching to the first non-blank
# character on the line.
vi-search-backward-fix() {
	zle vi-cmd-mode
	zle vi-history-search-backward
	zle .vi-first-non-blank
}
autoload vi-search-backward-fix
zle -N vi-search-backward-fix

vi-repeat-search-fix() {
	zle vi-repeat-search
	zle .vi-first-non-blank
}
autoload vi-repeat-search-fix
zle -N vi-repeat-search-fix

vi-rev-repeat-search-fix() {
	zle vi-rev-repeat-search
	zle .vi-first-non-blank
}
autoload vi-rev-repeat-search-fix
zle -N vi-rev-repeat-search-fix

bindkey -M viins '\e/' vi-search-backward-fix
bindkey -M vicmd '/' vi-search-backward-fix
bindkey -M vicmd 'n' vi-repeat-search-fix
bindkey -M vicmd 'N' vi-rev-repeat-search-fix
bindkey -M vicmd "k" vi-up-line-or-history
bindkey -M vicmd "j" vi-down-line-or-history
bindkey "^[[A" vi-up-line-or-history
bindkey "^[[B" vi-down-line-or-history
bindkey "^[OA" vi-up-line-or-history
bindkey "^[OB" vi-down-line-or-history

# Allow editing behind the point at which insert mode was entered
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line

# End of custom zle config -MR

# Additional history options
setopt extended_history # Add additional data to history like timestamp
setopt inc_append_history # Add immediately
setopt hist_find_no_dups # Don't show duplicates in search
setopt hist_ignore_space # Don't preserve spaces
setopt no_hist_beep # Don't beep
setopt share_history # Share history between sessions/terminals

autoload -Uz promptinit
promptinit
prompt adam2

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi
