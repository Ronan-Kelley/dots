# I normally start my DE from a tty; in environments
# with a display manager, this ensures the behavior
# of zsh is what I expect it to be.
if [ -z ${ZDOTDIR} ]; then
    source ~/.zprofile;
fi

############
# antidote #
############
# bootstrap antidote
if [ ! -d "${ZDOTDIR}/antidote" ]; then
    mkdir -p "${ZDOTDIR}"
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR}/antidote
fi
# source antidote (if needed) and load plugins (always)
zsh_plugins="${ZDOTDIR}/zsh_plugins"
if [[ ! "${zsh_plugins}.zsh" -nt "${zsh_plugins}.txt" ]]; then
  (
    source "${ZDOTDIR}/antidote/antidote.zsh";
    antidote bundle <"${zsh_plugins}.txt" >"${zsh_plugins}.zsh";
  )
fi
source "${zsh_plugins}.zsh";

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
# disable adding indicator to lines not terminated with a newline
unsetopt PROMPT_CR
# enable vi bindings
bindkey -v
# enable autocomplete features
zstyle :compinstall filename "$HOME"'/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# enable vcs integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '%r %b'
# enable bash-style help builtin
unalias run-help
autoload run-help
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
alias help=run-help

###########
# aliases #
###########
# ls
alias ls='ls --color=auto'
alias ll='ls --color=auto -l'
# clear
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
alias glp="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gb='git branch'
alias gi='git init'
alias gcl='git clone'
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

##########
# prompt #
##########
PROMPT="%(0?..%(148?..%F{9}%B%?%b%f ))%F{91}%B%n%b%f %~ %(!.#.$) "
