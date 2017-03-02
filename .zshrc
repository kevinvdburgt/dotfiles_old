# oh-my-zsh
plugins=(git)

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="agnoster"
export UPDATE_ZSH_DAYS=7
source $ZSH/oh-my-zsh.sh

# Additional files
source $HOME/.aliases

# Add binary executables
[ -d "$HOME/.bin" ] && export PATH=$PATH:$HOME/.bin
[ -d "$HOME/.scripts" ] && export PATH=$PATH:$HOME/.scripts
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
[ -d "$HOME/.composer/vendor/bin" ] && export PATH=$PATH:$HOME/.composer/vendor/bin
