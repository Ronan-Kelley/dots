#!/bin/zsh

# add some common directories to path
pathadd=("$HOME/Scripts" "$HOME/.cargo/bin" "$HOME/.local/bin")
for curpath in ${pathadd[@]}; do
    if [ -d $curpath ]; then
        PATH="$PATH:$curpath"
    fi
done
export PATH
