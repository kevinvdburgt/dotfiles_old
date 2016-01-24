#!/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Load the shell dotfiles
for file in $HOME/.{bash_prompt,exports}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Aliasses
alias ll="ls -hal"
