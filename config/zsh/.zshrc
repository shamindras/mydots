zmodload zsh/zprof # profiling, must be at top of `.zshrc`

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

# autoload compinit only once a day
# source: https://gist.github.com/ctechols/ca1035271ad134841284#file-compinit-zsh
# On slow systems, checking the cached .zcompdump file to see if it must be 
# regenerated adds a noticable delay to zsh startup.  This little hack restricts 
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

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

# configure direnv -------
eval "$(direnv hook zsh)"

# conda to path
PATH=/usr/local/anaconda3/bin:$PATH

# zprof # profiling, must be at the bottom of `.zshrc`
