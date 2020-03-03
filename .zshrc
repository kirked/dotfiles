zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower]} r:|[._-]=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=* l:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/Users/dkirk/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory notify
unsetopt beep
bindkey -v
autoload -Uz promptinit
promptinit
prompt fade red
export EDITOR=/usr/local/bin/nvim
export PAGER='less -R'
export COPYFILE_DISABLE=1

alias ll='ls -Alh'
alias ls='ls -F'
alias df='df -h'
alias du='du -h'
alias dv='dirs -v'
alias shcl='shadow-cljs'
alias top='top -u'
alias vi=/usr/local/bin/nvim

umask 0027
ulimit -S -n 1024

