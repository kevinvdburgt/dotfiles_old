#!/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

## Editor settings
export EDITOR=vim
export TERM=xterm-256color

## Path settings
export PATH=$PATH:$HOME/.bin:$HOME/.scripts

## Bash settings
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}

## Aliasses
alias ll="ls -hal"

