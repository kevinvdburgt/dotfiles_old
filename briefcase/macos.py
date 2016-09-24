#!/usr/bin/env python3
from lib.briefcase import Briefcase

Briefcase.shell("ls", False, "~/.ssh")
Briefcase.link("~/.dotfiles/README.md", "~/test.md")
Briefcase.save("default", "wallpaper", "none")
Briefcase.save("default", "wallpaper2", "none")
Briefcase.save("pos", "x", "100")
Briefcase.save("pos", "y", "100")
print(Briefcase.load("pos", "x", "200"))
print(Briefcase.load("pos", "y", "200"))
print(Briefcase.load("pos", "z", "200"))
print(Briefcase.load("asd", "asd", "123"))
