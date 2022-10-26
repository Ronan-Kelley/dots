#########
# shell #
#########
# history settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# enable autocd
setopt autocd
# disable beeping
unsetopt beep
# disable treating failed matches as an error
unsetopt nomatch
# disable getting notifications from changes in background job status as they happened
unsetopt notify
# enable vi bindings
bindkey -v
# enable autocomplete features
zstyle :compinstall filename "$HOME"'/.zshrc'
autoload -Uz compinit
compinit

###############
# environment #
###############
export EDITOR='nvim'
export PAGER='less'
export BROWSER='firefox'
export VISUAL='nvim'
export NVIMC="$HOME/.config/nvim"

###########
# aliases #
###########
# ls
alias ls='ls --color=auto'
alias ll='ls --color=auto -l'
# nnn file manager
n () {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        # instead of just blocking the call to nnn, exit the subshell
        exit
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -o "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

##########
# prompt #
##########
PROMPT="%(0?..%(148?..%F{9}%B%?%b%f ))%F{91}%B%n%b%f %~ %(!.#.$) "
