#!/usr/bin/env python3
from lib.briefcase import Briefcase

# Symlinks
Briefcase.link('~/.dotfiles/.aliases', '~/.aliases')
Briefcase.link('~/.dotfiles/.vimrc', '~/.vimrc')
Briefcase.link('~/.dotfiles/.tmux.conf', '~/.tmux.conf')
