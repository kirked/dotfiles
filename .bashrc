[[ -f $HOME/.bash_functions ]] && source $HOME/.bash_functions

alias ll='ls -Alh'
alias ls='ls -F'
alias df='df -h'
alias diff=icdiff
alias du='du -h'
alias dv='dirs -v'
alias top='top -u'

set editing-mode vi
set expand-tilde on
set mark-directories on

if [[ ! -z $PS1 ]]; then
  echo > /dev/null
else
  PS1='\[\e]1;\s\$ \W\a\e]2;\u@\h\a\]'"$PS1"
  SSH_ENV="$HOME/.ssh/environment"
  
  function start_ssh_agent {
    echo -n "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo succeeded
    chmod 0600 "$SSH_ENV"
    source "$SSH_ENV" > /dev/null
    /usr/bin/ssh-add $HOME/.ssh/id_bitbucket
  }
  
  if [ -f "$SSH_ENV" ]; then
    source "$SSH_ENV" > /dev/null
    echo "checking for SSH agent pid $SSH_AGENT_PID..."
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ > /dev/null || start_ssh_agent;
  else
    start_ssh_agent;
  fi
fi

