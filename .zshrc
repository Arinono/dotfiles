# Custom $PATH with extra locations.
export PATH=/bin:/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin:$HOME/.bin:$HOME/flutter/bin:/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin:$HOME/.cargo/bin:$HOME/.pub-cache/bin:$HOME/go/bin

# ohmz.sh
export ZSH="/Users/aurelien/.oh-my-zsh"
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
  status
  cmd_exec_time
  time
  dir
  git
  nvm
)
BULLETTRAIN_PROMPT_CHAR=">"
BULLETTRAIN_STATUS_EXIT_SHOW=true
source $ZSH/oh-my-zsh.sh

# Enable plugins.
plugins=(git history kubectl docker docker-compose git-auto-fetch yarn emoji vscode)

# Lang
export LANG=en_US.UTF-8

# Editor
export EDITOR='nano'

# GPG
export GPG_TTY=$(tty)

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Python settings
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

# Java settings
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JRE_HOME=$(/usr/libexec/java_home)

# Go settings
export GOPATH=$HOME/.go

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# Git aliases.
alias la="ls -ah"
alias ll="ls -lh"
alias lla="ls -lah"
alias d="docker"
alias c="code-insiders"
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias glg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gl='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
alias brew-upgrade='omz update ; brew update && (brew upgrade ; brew cask upgrade); brew cleanup'

# Completions.
autoload -Uz compinit && compinit
# Case insensitive.
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Git upstream branch syncer.
# Usage: gsync master (checks out master, pull upstream, push origin).
function gsync() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a branch."
     return 0
 fi

 BRANCHES=$(git branch --list $1)
 if [ ! "$BRANCHES" ] ; then
    echo "Branch $1 does not exist."
    return 0
 fi

 git checkout "$1" && \
 git pull upstream "$1" && \
 git push origin "$1"
}

# Super useful Docker container oneshots.
# Usage: dockrun, or dockrun [centos7|fedora27|debian9|debian8|ubuntu1404|etc.]
dockrun() {
 docker run -it geerlingguy/docker-"${1:-ubuntu1604}"-ansible /bin/bash
}

# Enter a running Docker container.
function denter() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a container ID or name."
     return 0
 fi

 docker exec -it $1 bash
 return 0
}

# Delete a given line number in the known_hosts file.
knownrm() {
 re='^[0-9]+$'
 if ! [[ $1 =~ $re ]] ; then
   echo "error: line number missing" >&2;
 else
   sed -i '' "$1d" ~/.ssh/known_hosts
 fi
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
