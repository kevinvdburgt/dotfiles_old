class SyncArchLinux:
    def __init__(self, briefcase):

        # Install new packages from pacman
        briefcase.shell('sudo pacman -Syu')

        # Install new packages from yaourt
        briefcase.shell('yaourt -Syua')

        # Symlink dotfiles
        briefcase.symlink('~/.dotfiles/.Xresources',            '~/.Xresources')
        briefcase.symlink('~/.dotfiles/.bash_profile',          '~/.bash_profile')
        briefcase.symlink('~/.dotfiles/.gtkrc-2.0',             '~/.gtkrc-2.0')
        briefcase.symlink('~/.dotfiles/.xinitrc',               '~/.xinitrc')

        briefcase.symlink('~/.dotfiles/.config/bspwm',          '~/.config/bspwm')
        briefcase.symlink('~/.dotfiles/.config/sxhkd',          '~/.config/sxhkd')
        briefcase.symlink('~/.dotfiles/.config/gtk-3.0',        '~/.config/gtk-3.0')
        briefcase.symlink('~/.dotfiles/.config/compton.conf',   '~/.config/compton.conf')

        briefcase.symlink('~/.dotfiles/.scripts',               '~/.scripts')
        briefcase.symlink('~/.dotfiles/.fonts',                 '~/.fonts')

        # Git projects from source
        briefcase.gitsource('https://github.com/baskerville/bspwm.git', 'bspwm',
            'make && cp -u bspwm bspc $HOME/.bin')

        briefcase.gitsource('https://github.com/baskerville/sxhkd.git', 'sxhkd',
            'make && cp -u sxhkd $HOME/.bin')

        briefcase.gitsource('https://github.com/LemonBoy/bar.git', 'lemonbar',
            'make && cp -u lemonbar $HOME/.bin')

        briefcase.gitsource('https://github.com/baskerville/xtitle.git', 'xtitle',
            'make && cp -u xtitle $HOME/.bin')
