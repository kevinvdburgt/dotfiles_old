class SyncOSX:
    def __init__(self):

        # Symlink dotfiles
        briefcase.symlink('~/.dotfiles/.bash_profile',          '~/.bash_profile')

        briefcase.symlink('~/.dotfiles/.scripts',               '~/.scripts')
