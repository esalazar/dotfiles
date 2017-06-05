autoload -U compinit
compinit
autoload -U colors
colors

setopt COMPLETE_ALIASES
setopt AUTO_CD
setopt CORRECT
setopt NO_BEEP

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

bindkey -v
export EDITOR=vim
export VISUAL=vim
bindkey ' \C-m' vi-cmd-mode

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.history

PROMPT="%{$fg[$reset_color]%}%n%{$reset_color%}@%{$fg[$reset_color]%}%c%{$reset_color%}%(!.#.>) "
RPROMPT="[%m %t]"

alias 'ls=ls -Ahl --color=auto --group-directories-first'
alias 'rm=rm -iv'
alias 'mv=mv -iv'
alias 'cp=cp -iv'
alias 'ln=ln -v'
alias 'k9=kill -9'
alias 'grep=grep --color=auto'
alias 'be=bundle exec'
alias 'v=vim'
compdef 'v=vim'
alias 'g=git'
compdef 'g=git'
alias 'standup=g log --all --since yesterday --oneline --author edgar'

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"
