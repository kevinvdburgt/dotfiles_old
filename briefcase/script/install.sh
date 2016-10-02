#!/bin/bash

# Check if git and python3 are installed on the machine
python=$(which python3)
[ -z "$python" ] && python=$(which python)

# Check if we found a python installation
if [ -z "$python" ]; then
  echo "Python3 is required"
  exit 1
fi

# Check if we have the correct version of Python
pythonVersion=$($python -V 2>&1 | awk '{print $2}')
pythonVersion=$(echo ${pythonVersion//./})
if [ "$pyhtonVersion" -lt "300" ]; then
  echo "Python3 is required"
  exit 1
fi

# Check if the git command exists
if ! command -v git > /dev/null 2>&1; then
  echo "git is required"
  exit 1
fi

# Check if the $HOME/.dotfiles folder already exists
if [ -d "$HOME/.dotfiles" ]; then
  echo "$HOME/.dotfiles folder already exists"
  exit 1
fi

# Clone the repository and run the update script
git clone git@github.com:kevinvdburgt/dotfiles.git $HOME/.dotfiles
$HOME/.dotfiles/briefcase/script/update.py
