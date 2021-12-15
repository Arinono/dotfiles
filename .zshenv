# ohmyz.sh
export ZSH="$HOME/.oh-my-zsh"

# Lang
export LANG=en_US.UTF-8

# Editor
export EDITOR='nano'

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Python settings
export PYTHONPATH="/usr/local/lib/python3.9/site-packages"

# Java settings
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JRE_HOME=$(/usr/libexec/java_home)

# Go settings
export GOPATH=$HOME/.go

# Node settings
export N_PREFIX=$HOMEBREW_PREFIX/share/n/versions

# Wasmer settings
export WASMER_DIR="/Users/arinono/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Rust settings
source "$HOME/.cargo/env"

# Puppeteer fix for apple silicon
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# wasm-pack fix for apple silicon
export WASM_PACK_PATH=$(which wasm-pack)
. "$HOME/.cargo/env"

# dart
export DART_SDK=$HOMEBREW_PREFIX/opt/dart/libexec
