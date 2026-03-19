#!/usr/bin/env zsh

# ls
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls --color=auto -l'

# don't clear scrollback on clear
alias clear='clear -x'

# git
alias gs='git status --short'
alias gsw='git switch'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gu='git pull'
alias gco='git checkout'
alias gl='git log'
alias glg='git log --graph --oneline'
alias glp="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gb='git branch'
alias gi='git init'
alias gcl='git clone'

##################
# neovim "modes" #
##################

# open neovim directly to git window
alias ngit='nvim "+Git | 2q"'
# expects to have a git diff piped in as input; view a git diff
# with every file automatically folded minus the name
ngitdiff() {
    # first + argument sets the filetype, buffer type, and sets up the folds
    # second + argument collapses all of the folds assuming default fold binds
    nvim - +"set ft=git buftype=nofile foldmethod=expr foldexpr=getline(v:lnum)\!~'^diff\\\\s--git'" +"normal zM"
}

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

    # nnn command
    #   -o: open files only on enter key
    #   -e: open text files in $VISUAL (fallback $EDITOR, fallback vi)
    #   -u: use selection if available, don't prompt to choose between selection and hovered
    #   -J: don't auto-advance on select
    #   -A: don't auto-enter a directory if it is the only pattern match for a search
    nnn -oeuJA "$@"

    if [ -f "$NNN_TMPFILE" ]; then
        # don't cd if we're already there to keep cd history clean for cd -
        # the way that nnn stores its tmpfile is horrific it's true
        if [ ! "$(pwd)" = "$(sed -E 's/[^'"'"']*'"'"'(.*)'"'"'/\1/;s:'"'\\\\''"':'"'"':g' "${NNN_TMPFILE}")" ];
        then
            . "$NNN_TMPFILE"
        fi
        rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
