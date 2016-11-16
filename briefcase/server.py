#!/usr/bin/env python3
from lib.briefcase import Briefcase

##
# Sync dotfiles on my server
##

Briefcase.link("~/.dotfiles/.scripts", "~/.scripts")
