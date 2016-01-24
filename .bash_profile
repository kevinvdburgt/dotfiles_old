#!/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Load the shell dotfiles
for file in $HOME/.{bash_prompt}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Editor settings
export EDITOR=vim
export TERM=xterm-256color

# Path settings
export PATH=$PATH:$HOME/.bin:$HOME/.scripts

# Bash settings
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}

# Aliasses
alias ll="ls -hal"
