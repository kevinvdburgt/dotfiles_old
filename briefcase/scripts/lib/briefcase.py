import os
import shutil
import subprocess
import configparser

class Briefcase:

    # Run a shell command
    @classmethod
    def shell(cls, command, shell=False, cwd=None):
        # Resolve the full path when the tilde (~) has been used, for example:
        # ~/.scripts/hi.sh which will results in /home/$USER/.scripts/hi.sh
        if cwd != None and cwd[0] == '~':
            cwd = os.path.expanduser(cwd)

        return subprocess.call(command, shell=shell, cwd=cwd)

    # Symlink a file or folder
    @classmethod
    def link(cls, source, destination):
        # First, check if the source file already exists on the system which
        # should be linked to its destination
        if (os.path.isfile(os.path.expanduser(source)) == False and
            os.path.isdir(os.path.expanduser(source)) == False):
            print("ERROR: The source ({:s}) does not exists.".format(os.path.expanduser(source)))
            return

        # Check if the source has already been symlinked to the destination
        if (os.path.islink(os.path.expanduser(destination)) == True and
            os.readlink(os.path.expanduser(destination)) == os.path.expanduser(source)):
            print("INFO: Symlink ({:s}) has already been linked, skipping..".format(os.path.expanduser(destination)))
            return

        # Check if the destination file already exists which isnt a link, this
        # means there is a collision with the to be linked file or folder
        # Ask the user what to do with the already existing destination file
        if (os.path.isfile(os.path.expanduser(destination)) == True or
            os.path.isdir(os.path.expanduser(destination)) == True):
            print("WARNING: The destination file or folder already exists!")
            print("Move {:s} to the briefcase backup directory?".format(os.path.expanduser(destination)))

            # Wait for user input
            response = input("Press continue to skip, or type 'y' to move the file: ")
            if response != "y" and response != "yes":
                return

            # Move the destination file to the backup director when accepted
            shutil.move(os.path.expanduser(destination), os.path.expanduser('~/.dotfiles/briefcase/backup/'))

            cls.save("linkbackup", os.path.expanduser(destination), os.path.expanduser(source))

        # All checks has been checked, we are now ready to link the file
        os.symlink(os.path.expanduser(source), os.path.expanduser(destination))
        print("INFO: Symlink ({:s}) created".format(os.path.expanduser(destination)))

    # Write a configuration setting
    @classmethod
    def save(cls, section, key, value):
        configFile = os.path.expanduser("~/.dotfiles/briefcase/config.ini")
        config = configparser.ConfigParser()

        if os.path.isfile(configFile):
            config.read(configFile)

        if section not in config.sections():
            config.add_section(section)

        config.set(section, key, str(value))

        with open(configFile, 'w') as stream:
            config.write(stream)

    # Read a configuration setting
    @classmethod
    def load(cls, section, key, defaultValue=None):
        configFile = os.path.expanduser("~/.dotfiles/briefcase/config.ini")
        config = configparser.ConfigParser()

        if os.path.isfile(configFile) == False:
            return defaultValue

        config.read(configFile)

        if section not in config.sections():
            return defaultValue

        if config.has_option(section, key) == False:
            return defaultValue

        return config.get(section, key)

