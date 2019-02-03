add_to_path() {
	export PATH="$1":"$PATH"
}
export -f add_to_path

[[ -s "/usr/lib/ccache/bin" ]] && add_to_path "/usr/lib/ccache/bin"

add_to_path "$HOME/.cargo/bin"

add_to_path "$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Enable touch screen scrolling for firefox
export MOZ_USE_XINPUT2=1

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

if [ -n "$BASH" ] && [ -r ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] && [ -z "$TMUX" ] && [ -z "$SSH_CONNECTION" ]; then
	exec startx
fi
