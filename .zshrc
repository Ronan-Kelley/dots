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
zstyle :compinstall filename '/home/ronan/.zshrc'
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

##########
# prompt #
##########
PROMPT="%(0?..%(148?..%F{9}%B%?%b%f ))%F{91}%B%n%b%f %~ %(!.#.$) "
