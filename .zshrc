autoload -U compinit
compinit
autoload -U colors
colors

setopt COMPLETE_ALIASES
setopt AUTO_CD
setopt CORRECT
setopt NO_BEEP

bindkey -v
export EDITOR=vim
export VISUAL=vim
bindkey ';;' vi-cmd-mode

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.history

PROMPT="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%c%{$reset_color%}%(!.#.>) "
RPROMPT="[%m %t]"

alias 'ls=ls -Gh'
alias 'rm=rm -iv'
alias 'mv=mv -iv'
alias 'cp=cp -iv'
alias 'ln=ln -v'
alias 'grep=grep --color=auto'
alias 'be=bundle exec'
alias 'v=vim'
compdef 'v=vim'
alias 'g=git'
compdef 'g=git'
alias 'standup=g log --all --since yesterday --oneline --author edgar'
