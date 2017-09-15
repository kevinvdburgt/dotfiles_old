#!/usr/bin/env python3
from lib.briefcase import Briefcase

# Symlinks
Briefcase.link('~/.dotfiles/.aliases', '~/.aliases')
Briefcase.link('~/.dotfiles/.gitattributes', '~/.gitattributes')
Briefcase.link('~/.dotfiles/.gitconfig', '~/.gitconfig')
Briefcase.link('~/.dotfiles/.gitignore_global', '~/.gitignore_global')
Briefcase.link('~/.dotfiles/.zshrc', '~/.zshrc')
Briefcase.link('~/.dotfiles/.kwm', '~/.kwm')
