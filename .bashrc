#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vim='nvim'
alias vi='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

export PATH=$PATH:/home/trikztr/.spicetify
export PATH=$PATH:/home/trikztr/.dotnet
export PATH=$PATH:/opt/JetBrains\ Rider-2024.1.4/bin
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
