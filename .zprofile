export LC_ALL="en_US.UTF8"
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="$PATH:$HOME/.yarn/bin"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export FZF_DEFAULT_OPTS="--layout=reverse --info=inline -i"

mpd &
startx
