# clear the "Last login" message for new tabs in terminal --------
# source: https://stackoverflow.com/a/69915614/4687531
printf '\33c\e[3J'

# load all of the conf.d scripts --------
# the alphanumeric sort order of numbered scripts will be used
setopt extended_glob
for _rcfile in $ZDOTDIR/conf.d/*.zsh(.N); do
  [[ ${_rcfile:t} != '~'* ]] || continue
  source "$_rcfile"
done
unset _rcfile

# local overrides --------
# [[ ! -f $DOTFILES.local/zsh/zshrc_local.zsh ]] || source $DOTFILES.local/zsh/zshrc_local.zsh

# load custom functions --------
# where to look for autoloaded/custom functions
# source: https://github.com/rothgar/mastering-zsh/blob/921766e642bcf02d0f1be8fc57d0159a867299b0/docs/config/general.md#fpath
local ZFUNCDIR="${ZFUNCDIR:-${ZDOTDIR:-~/.config/zsh}/functions}"

function autoload-entire-dir() {
  ### lazy load all functions in a dir
  [[ -d "$1" ]] || return 1
  fpath=("$1" $fpath)  # add the directory to fpath
  local fn
  for fn in "$1"/*(.N); do
    autoload -Uz "$fn"
  done
}

# autoload all custom functions in $ZFUNCDIR and add $ZFUNCDIR to fpath
# source: https://github.com/zshzoo/zfunctions/blob/467f333ff3c7df9c817523f5470a588e3626a755/zfunctions.zsh
autoload-entire-dir "$ZFUNCDIR"

# configure menu selection --------
autoload -Uz compinit
compinit
# zstyle ':completion:*' menu select

# configure keybindings --------
# bindkeys - emacs style
bindkey -e

bindkey "^A"   beginning-of-line                    # ctrl-a
bindkey "^B"   backward-char                        # ctrl-b
bindkey "^E"   end-of-line                          # ctrl-e
# bindkey "^D"   delete-char                          # ctrl-d
bindkey "^D"   backward-delete-word                 # ctrl-d
bindkey "^K"   kill-line                            # ctrl-k
bindkey "^N"   down-line-or-search                  # ctrl-n
bindkey "^P"   up-line-or-search                    # ctrl-p
# bindkey "^R"   history-incremental-search-backward  # ctrl-r, now with fzf
bindkey "^U"   kill-whole-line  # ctrl-u
bindkey "^[[B" history-search-forward               # down arrow
bindkey "^[[A" history-search-backward              # up arrow

# configure zoxide --------
# source: https://github.com/ajeetdsouza/zoxide/tree/d99e9b7d8671946dafe53662c519045f84d1d334#step-2-add-zoxide-to-your-shell
eval "$(zoxide init zsh)"

# configure fzf --------
# add fzf completions to zsh 
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# fzf auto-completion
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# fzf key bindings
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# configure pyenv -------
eval "$(pyenv init -)"

# configure pyenv-virtualenv -------
# NOTE: this is a hack to speed up the shell startup time caused by the 
# default virtualenv-init command (commented out below).
# source: https://github.com/pyenv/pyenv-virtualenv/issues/259#issuecomment-1007432346
# TODO: evaluate this and check behavior over time.

# eval "$(pyenv virtualenv-init -)" # default command
eval "$(pyenv virtualenv-init - | sed s/precmd/precwd/g)"
