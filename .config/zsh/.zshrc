export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="steeef"

plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias clear-history="echo ' ' > $HISTFILE && history -c"
alias open="xdg-open"
alias full_upgrade="sudo pacman -Syu && echo '\n\n\n' && yay -Syu && echo '\n\n\n' && yarn global upgrade"
alias bat="bat -p --theme gruvbox-dark"
alias cpt="cp $HOME/chamber_of_magic/test/main.cpp"
alias deskrec="ffmpeg -framerate 25 -f x11grab -i :0.0"
alias gd="git diff --patch --stat"
alias gdf='git status -s | sed -E "/(^\?\?)|(^M )/d" | awk "{ print \$2 }" | fzf --preview "bat -p --color always -l diff <(git diff --patch --stat {})"'

# Clear history on start and exit
clear-history 2> /dev/null
trap 'clear-history 2> /dev/null' EXIT

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam cursor shape for each new prompt
_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

colorscript --random
