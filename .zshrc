# oh-my-zsh
plugins=(git)

export ZSH=/Users/kevin/.oh-my-zsh
export ZSH_THEME="agnoster"
export UPDATE_ZSH_DAYS=7
source $ZSH/oh-my-zsh.sh

# Additional files
source $HOME/.aliases

# Add binary executables
[ -d "$HOME/.bin" ] && export PATH=$PATH:$HOME/.bin
[ -d "$HOME/.scripts" ] && export PATH=$PATH:$HOME/.scripts

export NVM_DIR="/Users/kevin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
