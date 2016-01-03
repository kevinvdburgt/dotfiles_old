import os
import subprocess

class Briefcase:
    def symlink(self, source, destination):
        # Check if the source file exists
        if (os.path.isfile(os.path.expanduser(source)) == False and
            os.path.isdir(os.path.expanduser(source)) == False):
            print("Error, the source {:s} does not exists".format(os.path.expanduser(source)))
            return

        if (os.path.islink(os.path.expanduser(destination)) == True and
            os.readlink(os.path.expanduser(destination)) == os.path.expanduser(source)):
            print("Symlink already exists: {:s}".format(os.path.expanduser(source)))
            return

        # Check if the destination file already exists, if so ask the user to move the
        # file to the briefcase backup directory.
        if (os.path.isfile(os.path.expanduser(destination)) == True or
            os.path.isdir(os.path.expanduser(destination)) == True):
            print("Warning! The destination file or folder already exists!")
            print("Move {:s} to the briefcase backup directory?")

            response = input('Press continue to skip, or type \'y\' or \'yes\' to move the file: ')
            if response != "y" and response != "yes":
                return

            os.rename(os.path.expanduser(destination), os.path.expanduser('~/.dotfiles/briefcase/backup/'))

        # Checks are done, create the link
        os.symlink(os.path.expanduser(source), os.path.expanduser(destination))
        print("Symlink created: {:s}".format(os.path.expanduser(source)))

    def shell(self, command):
        subprocess.call(command, shell=True)
