#!/bin/bash

# Required dependencies for the briefcase script are Python3 and GIT.
# Check if it exists on the current system, if not, abort the installtion.
if [ command -v python3 >/dev/null 2>&1 ]; then
  echo "python3 is required for the briefcase script"
  exit 1
fi

if [ command -v git >/dev/null 2>&1 ]; then
  echo "git is required for the briefcase script"
  exit 1
fi

# When the $HOME/.dotfiles folder exists, check if it uses the correct repo.
# If not, exit the script, because we dont want to mess things up.
if [ -d "$HOME/.dotfiles" ]; then
  cd $HOME/.dotfiles
  if [ ! $(git config --get remote.origin.url) == "git@github.com:kevinvdburgt/dotfiles.git" ] && [ -d $HOME/.dotfiles ]; then
    echo "The folder $HOME/.dotfiles is already in use, please remove that folder and run the script again"
    exit 1
  fi
  echo "Updating repository.."
  git pull
else
  echo "Installing repository.."
  git clone git@github.com:kevinvdburgt/dotfiles.git $HOME/.dotfiles
fi

# Run the update script
echo "TODO"
