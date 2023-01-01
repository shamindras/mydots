###
# My aliases
###

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# misc
alias zshrc='${EDITOR:-nvim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'

if [[ "$OSTYPE" == darwin* ]]; then
  alias code="open -b com.microsoft.VSCode"
fi
