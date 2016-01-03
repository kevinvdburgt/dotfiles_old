class SyncOSX:
    def __init__(self, briefcase):

        # Symlink dotfiles
        briefcase.symlink('~/.dotfiles/.bash_profile',          '~/.bash_profile')

        briefcase.symlink('~/.dotfiles/.scripts',               '~/.scripts')
