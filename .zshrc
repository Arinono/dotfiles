# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GPG_TTY=$(tty)

# ohmz.sh
ZSH_THEME="powerlevel10k"

# Enable plugins.
plugins=(git history kubectl docker docker-compose git-auto-fetch yarn emoji vscode)

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/oh-my-zsh.sh

# Git aliases.
alias la="ls -ah"
alias ll="ls -lh"
alias lla="ls -lah"
alias d="docker"
alias c="code-insiders"
alias gs='git status'
alias gp='git pull --rebase'
alias gl='git lol'
alias gla='git lola'
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
alias upgrades='omz update; brew update && (brew upgrade; brew upgrade --cask); brew cleanup; n lts; n latest; rustup update; (v up && v -prod self)'
alias tmclean='for d in $(tmutil listlocalsnapshotdates | grep "-"); do sudo tmutil deletelocalsnapshots $d; done'
alias thtop='htop -t -s PERCENT_CPU -u $USER'
