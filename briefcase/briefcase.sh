#/!bin/bash

# Validate if the required dependencies exists on the machine, in case those
# required dependencies doesnt exists on the machine, abort the script and tell
# the user to install those required dependencies.
if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 is required for the briefcase script"
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  echo "git is required for the briefcase script"
  exit 1
fi

# When $HOME/.dotfiles folder exists and if the $HOME/.dotfiles folder also has
# the specified remote, then update the git pull command. Otherwise start the
# installation.
if [ -d "$HOME/.dotfiles" ]; then
  cd $HOME/.dotfiles
  if [ ! $(git config --get remote.origin.url) == "git@github.com:kevinvdburgt/dotfiles.git" ] && [ -d $HOME/.dotfiles ]; then
    echo "The folder $HOME/.dotfiles already exists on your system and is not"
    echo "related to the dotfiles project."
    exit 1
  fi
  echo "Updating repository.."
  git pull
else
  echo "Installing repository.."
  git clone git@github.com:kevinvdburgt/dotfiles.git $HOME/.dotfiles
fi

# Check if there is a matching python script according to our hostname.
if [ -f "$HOME/.dotfiles/briefcase/scripts/$(hostname).py" ]; then
  echo "Executing $HOME/.dotfiles/briefcase/scripts/$(hostname).py..."
  python3 $HOME/.dotfiles/briefcase/scripts/$(hostname).py
else
  echo "Script not found for $(hostname)"
  exit 1
fi
