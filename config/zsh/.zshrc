# load zprof first if we need to profile
[[ ${ZPROFRC:-0} -eq 0 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# conf.d
setopt extended_glob
for _rcfile in $ZDOTDIR/conf.d/*.zsh(.N); do
  [[ ${_rcfile:t} != '~'* ]] || continue
  source "$_rcfile"
done
unset _rcfile

# local overrides
# [[ ! -f $DOTFILES.local/zsh/zshrc_local.zsh ]] || source $DOTFILES.local/zsh/zshrc_local.zsh

# Add zoxide to the zsh
# Source:
# https://github.com/ajeetdsouza/zoxide/tree/d99e9b7d8671946dafe53662c519045f84d1d334#step-2-add-zoxide-to-your-shell
eval "$(zoxide init zsh)"

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

# menu selection
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

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
bindkey "^R"   history-incremental-search-backward  # ctrl-r
bindkey "^U"   kill-whole-line  # ctrl-u
bindkey "^[[B" history-search-forward               # down arrow
bindkey "^[[A" history-search-backward              # up arrow

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
