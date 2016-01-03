import os

class SyncOSX:
    def __init__(self, briefcase):

        # Symlink dotfiles
        briefcase.symlink('~/.dotfiles/.bash_profile',          '~/.bash_profile')

        briefcase.symlink('~/.dotfiles/.scripts',               '~/.scripts')

        # Update wallpaper
        settings_wallpaper_remote_url = briefcase.get('settings', 'wallpaper', 'remote_url')
        localset_wallpaper_remote_url = briefcase.get('localset', 'wallpaper', 'remote_url')
        if settings_wallpaper_remote_url != localset_wallpaper_remote_url:
            briefcase.shell('curl ' + settings_wallpaper_remote_url + ' -o wallpaper.jpg', True, '~/.config/');
            print('osascript -e \'tell application "Finder" to set desktop picture to POSIX file "' + os.path.expanduser('~/.config/wallpaper.jpg') + '"\'')
            briefcase.set('localset', 'wallpaper', 'remote_url', settings_wallpaper_remote_url)
