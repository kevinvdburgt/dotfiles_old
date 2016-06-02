import os

class Target:
    def __init__(self, briefcase):
        # Symlink dotfiles
        briefcase.symlink('~/.dotfiles/.scripts',                 '~/.scripts')
        briefcase.symlink('~/.dotfiles/.curlrc',                  '~/.curlrc')
        briefcase.symlink('~/.dotfiles/.gitconfig',               '~/.gitconfig')
        briefcase.symlink('~/.dotfiles/.gitignore_global',        '~/.gitignore_global')
        briefcase.symlink('~/.dotfiles/.screenrc',                '~/.screenrc')
        briefcase.symlink('~/.dotfiles/.vimrc',                   '~/.vimrc')
        briefcase.symlink('~/.dotfiles/.wgetrc',                  '~/.wgetrc')

        # Install and update software packages from brew
        # briefcase.shell('brew update')
        # briefcase.shell('brew upgrade --all')

        # Symlink dotfiles
        # briefcase.symlink('~/.dotfiles/.bash_profile',          '~/.bash_profile')
        # briefcase.symlink('~/.dotfiles/.gitconfig',             '~/.gitconfig')
        # briefcase.symlink('~/.dotfiles/.gitignore_global',      '~/.gitignore_global')
        # briefcase.symlink('~/.dotfiles/.scripts',               '~/.scripts')
        # briefcase.symlink('~/.dotfiles/.atom/config.cson',      '~/.atom/config.cson')
        # briefcase.symlink('~/.dotfiles/.wgetrc',                '~/.wgetrc')
        # briefcase.symlink('~/.dotfiles/.vimrc',                 '~/.vimrc')
        # briefcase.symlink('~/.dotfiles/.screenrc',              '~/.screenrc')
        # briefcase.symlink('~/.dotfiles/.curlrc',                '~/.curlrc')
        # briefcase.symlink('~/.dotfiles/.bash_prompt',           '~/.bash_prompt')
        # briefcase.symlink('~/.dotfiles/.exports',               '~/.exports')

        # Update wallpaper
        # settings_wallpaper_remote_url = briefcase.get('settings', 'wallpaper', 'remote_url')
        # localset_wallpaper_remote_url = briefcase.get('localset', 'wallpaper', 'remote_url')
        # if settings_wallpaper_remote_url != localset_wallpaper_remote_url:
        #     briefcase.shell('curl ' + settings_wallpaper_remote_url + ' -o wallpaper.png', True, '~/.config/');
        #     briefcase.shell('osascript -e \'tell application "Finder" to set desktop picture to POSIX file "' + os.path.expanduser('~/.config/wallpaper.png') + '"\'')
        #     briefcase.shell('killall Dock')
        #     briefcase.set('localset', 'wallpaper', 'remote_url', settings_wallpaper_remote_url)
