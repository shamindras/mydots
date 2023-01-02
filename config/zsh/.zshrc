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
[[ ! -f $DOTFILES.local/zsh/zshrc_local.zsh ]] || source $DOTFILES.local/zsh/zshrc_local.zsh

# Add zoxide to the zsh
# Source:
# https://github.com/ajeetdsouza/zoxide/tree/d99e9b7d8671946dafe53662c519045f84d1d334#step-2-add-zoxide-to-your-shell
eval "$(zoxide init zsh)"

# where to look for autoloaded/custom functions
# source: https://github.com/rothgar/mastering-zsh/blob/921766e642bcf02d0f1be8fc57d0159a867299b0/docs/config/general.md#fpath
fpath+="${ZDOTDIR:-~}/functions" 

# done profiling
[[ ${ZPROFRC:-0} -eq 0 ]] || { unset ZPROFRC && zprof }
