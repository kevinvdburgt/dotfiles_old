import os
import subprocess
import shutil
import configparser

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

            shutil.move(os.path.expanduser(destination), os.path.expanduser('~/.dotfiles/briefcase/backup/'))

        # Checks are done, create the link
        os.symlink(os.path.expanduser(source), os.path.expanduser(destination))
        print("Symlink created: {:s}".format(os.path.expanduser(source)))

    def shell(self, command, shell=True, cwd=None):
        if cwd != None and cwd[0] == '~':
            cwd=os.path.expanduser(cwd)

        subprocess.call(command, shell=shell, cwd=cwd)

    def gitsource(self, repository, projectname, shellcommand):
        projectPath = os.path.expanduser('~/.source/' + projectname)

        # Create new project
        if os.path.isdir(projectPath) == False:
            self.shell('mkdir -p ' + projectPath)
            self.shell('git clone ' + repository + ' ' + projectPath)
            self.shell(shellcommand, True, projectPath)
        else:
            self.shell('git fetch origin', True, projectPath)
            result = subprocess.check_output('git log HEAD..origin/master --oneline', cwd=projectPath, shell=True).decode('utf-8')
            if result != '':
                self.shell('git merge origin/master', True, projectPath)
                self.shell(shellcommand, True, projectPath)

    def set(self, config, section, key, value):
        configFile = os.path.expanduser('~/.dotfiles/briefcase/' + config + '.ini')
        config = configparser.ConfigParser()

        if os.path.isfile(configFile):
            config.read(configFile)

        if section not in config.sections():
            config.add_section(section)

        config.set(section, key, str(value))

        with open(configFile, 'w') as configfile:
            config.write(configfile)

    def get(self, config, section, key):
        configFile = os.path.expanduser('~/.dotfiles/briefcase/' + config + '.ini')
        config = configparser.ConfigParser()

        if os.path.isfile(configFile) == False:
            return ''

        config.read(configFile)

        if section not in config.sections():
            return ''

        return config.get(section, key)
