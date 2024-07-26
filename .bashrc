cd ~

bind 'set bell-style none'

source "$HOME/bash_bin/mkcd.sh"

# Shortcuts to dotfiles
DOTTERM="$HOME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
DOTNVIM="$HOME/AppData/Local/nvim/init.lua"

function cdll {
	cd $1
	ll
}

