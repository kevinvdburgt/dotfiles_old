#!/usr/bin/env python3
from lib.briefcase import Briefcase

# Symlinks
Briefcase.link('~/.dotfiles/.aliases', '~/.aliases')
Briefcase.link('~/.dotfiles/.vimrc', '~/.vimrc')
Briefcase.link('~/.dotfiles/.vim/colors', '~/.vim/colors')
Briefcase.link('~/.dotfiles/.tmux.conf', '~/.tmux.conf')
Briefcase.link('~/.dotfiles/.atom', '~/.atom')

