# source: https://github.com/mattmc3/zebrafish/blob/a5808bf655d604a48ac8bc58d47c4aac955475e9/zebrafish.zsh#L166-L173
# this is set up after options in zebrafish, so we will load it after 
# ./02-zopts.zsh as well

# $HISTFILE belongs in the data home, not with zsh configs
HISTFILE=${XDG_DATA_HOME:-~/.local/share}/zsh/history
[[ -f "$HISTFILE" ]] || { mkdir -p "$HISTFILE:h" && touch "$HISTFILE" }

# you can set $SAVEHIST and $HISTSIZE to anything greater than the ZSH defaults
# (1000 and 2000 respectively), but if not we make them way bigger.
[[ $SAVEHIST -gt 1000 ]] || SAVEHIST=20000
[[ $HISTSIZE -gt 2000 ]] || HISTSIZE=100000


