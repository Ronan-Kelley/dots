#!/usr/bin/env zsh

############
# antidote #
############
# bootstrap antidote
if [ ! -d "${ZDOTDIR}/antidote" ]; then
    mkdir -p "${ZDOTDIR}"
    git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR}/antidote"
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
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY         # append to history file
setopt HIST_NO_STORE          # Don't store history commands

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

##########
# prompt #
##########
PROMPT="%(0?..%(148?..%F{9}%B%?%b%f ))%F{91}%B%n%b%f %~ %(!.#.$) "

# load aliases/functions
source "${ZDOTDIR}/zsh_aliases.zsh"
# load local-only aliases/functions
[ -f "${ZDOTDIR}/local_only/aliases" ] && source "${ZDOTDIR}/local_only/aliases"
