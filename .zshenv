# Custom $PATH with extra locations.
export PATH=/bin:/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin:$HOME/.bin:$

# ohmyz.sh
export ZSH="$HOME/.oh-my-zsh"

# Lang
export LANG=en_US.UTF-8

# Editor
export EDITOR='nano'

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Python settings
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"

# Java settings
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JRE_HOME=$(/usr/libexec/java_home)

# Go settings
export GOPATH=$HOME/.go

# Wasmer settings
export WASMER_DIR="/Users/aurelien/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

source "$HOME/.cargo/env"
