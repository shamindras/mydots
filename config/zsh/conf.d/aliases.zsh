###
# My aliases
###

# common paths ----
# dropbox --
alias db="z $home/dropbox"
alias dbc="z $home/dropbox/courses"
alias dbrep="z $home/dropbox/repos"
alias dbleaf="z $home/dropbox/overleaf"
alias dblean="z $home/dropbox/my_lean_projects"
alias dbres="z $home/dropbox/research"

# google drive --
alias gdc="z $home/gdrive_cmu"
alias gdp="z $home/gdrive_personal"

# general dirs --
alias home="z $home"
alias desk="z $home/desktop"
alias dl="z $home/downloads"

# current projects --
alias cbox="z $home/dropbox/repos/codebox"
alias dot="z $home/dropbox/repos/ss_dotfiles"
alias sce="z $home/dropbox/repos/sce"
alias ssapps="z $home/dropbox/repos/ss_application"
alias ssquarto="z $home/dropbox/repos/ss_personal_quarto_blog"

# many of these were sourced and adapted from the following:
# source: https://github.com/ericmjl/dotfiles/tree/master/.shell_aliases
alias b='bat --style=grid,numbers'
alias bat='bat --style=grid,numbers'
alias cd='z' # use zoxide as the default cd tool
alias ..='z ..'
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias cdd='z -'
alias cls=clear
alias cp='cp -r'
alias cpi='cp -iv'
alias d='dirs -v | head -10'
alias diff="diff-so-fancy"
alias df='df -kh'
alias dus='du -sckx * | sort -nr'
alias edi='emacs --debug-init'
alias ediwd='emacs --debug-init .'
alias ed='open -a /applications/emacs.app'
alias edwd='open -a /applications/emacs.app .'
alias ela='exa -al --color=always --group-directories-first'
alias filecount='ls -arf | wc -l'
alias g=git
alias histg='history | grep'
alias jn="jupyter notebook"
alias jl="jupyter lab"
alias ls='exa --color=always --group-directories-first --icons'
alias l='exa -l --color=always --group-directories-first --icons'
alias ll='exa -la --color=always --group-directories-first --icons'
alias lh='exa -lah --color=always --group-directories-first --icons'
alias lg='lazygit'
alias less='less -r'
alias md='mkdir -p'
alias mvi='mv -iv'
alias rmi='rm -i'
alias rmf='rm -rf'
alias rs='open -a /applications/rstudio.app .'
alias sc="source $HOME/.zshrc" # source ~/.zshrc
alias ta="tmux a -t"
alias tn="tmux new -s"
alias tl="tmux ls"
alias tree="exa --tree --all --group-directories-first --icons -i '.git|.svn|.hg|.idea|.vscode|.rproj.user'"
alias t1="tree --level=1"
alias tl1="t1 --long"
alias t2="tree --level=2"
alias tl2="t2 --long"
alias t3="tree --level=3"
alias tl3="t3 --long"
alias t4="tree --level=4"
alias tl4="t4 --long"
alias top=htop
alias ttop='top -ocpu -r -f -s 2 ln30'
alias v='nvim'
alias vi='nvim'
alias wget='wget -c'

# additional clean/wash aliases --
# source: https://github.com/ameensol/shell/blob/master/.zshenv#l29-l30
# clean up current directory
alias clean="find . -maxdepth 1 -name '*.ds_store' -o -name '*~' -o -name '.*~' -o -name '*.swo' -o -name '*.swp' -o -name '.*.swo' | xargs rm"

# clean up current directory and all subdirectories
alias wash="find . -name '*.ds_store' -o -name '*~' -o -name '.*~' -o -name '*.swo' -o -name '*.swp' -o -name '.*.swo' | xargs rm"

# application open suffix alias
# source:
# https://github.com/sdaschner/dotfiles/blob/91f9578b6cf926efb06bb3b1ebbd1ccd0715e06d/.aliases#l327-l336
# note: for macos we use `open -gj` to open the application in the background
alias -s {pdf,pdf}='open -gja skim.app'
alias -s {jpg,jpg,png,png}='open -gja preview.app'
alias -s {ods,ods,odt,odt,odp,odp,doc,doc,docx,docx,xls,xls,xlsx,xlsx,xlsm,xlsm,ppt,ppt,pptx,pptx,csv,csv}='open -gja libreoffice.app'
alias -s {html,html}='open -gja google\ chrome.app'
alias -s {mp4,mp4,mov,mov,mkv,mkv}='open -gja vlc.app'
alias -s {zip,zip,war,war}="unzip -l"
alias -s gz="tar -tf"
alias -s {tgz,tgz}="tar -tf"

# misc
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'

if [[ "$OSTYPE" == darwin* ]]; then
  alias code="open -b com.microsoft.VSCode"
fi
