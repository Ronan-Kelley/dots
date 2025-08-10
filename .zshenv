#!/bin/zsh

# set ZDOTDIR to not my home dir
export ZDOTDIR="${HOME}/.config/zsh"

# add some common directories to path
pathback=( "${HOME}/.cargo/bin" "${HOME}/.local/bin" )
pathfront=( "${HOME}/Scripts" "${HOME}/bin" )
for curpath in ${pathback[@]}; do
    if [ -d "${curpath}" ]; then
        PATH="${PATH}:${curback}"
    fi
done
for curpath in ${pathfront[@]}; do
    if [ -d "${curpath}" ]; then
        PATH="${curfront}:${PATH}"
    fi
done
export PATH

export EDITOR='nvim'
export PAGER='less'
export BROWSER='firefox'
export VISUAL='nvim'
export NVIMC="$HOME/.config/nvim"
