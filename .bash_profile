#!/usr/bin/env bash

export PATH=$HOME/.bin:$HOME/.bin/Argyll_V1.6.3/bin:/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/usr/man:/usr/share/man:/usr/local/man:/usr/local/share/man
export PAGER='less -R'
export RI='--format ansi --width 100'
export NODE_PATH=/usr/local/lib/node_modules
export PS1='[\!:\w] \u$ '
export SBT_OPTS='-server -Xms256m -Xmx1024m -XX:MaxMetaspaceSize=256m -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled'

[[ -x $HOME/.bashrc ]] && source $HOME/.bashrc
[[ -x $HOME/.bash_functions ]] && source $HOME/.bash_functions
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

ulimit -S -n 1024
