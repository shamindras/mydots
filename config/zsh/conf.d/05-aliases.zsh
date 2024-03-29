#!/usr/bin/env bash

# Common paths ----
# Dropbox --
alias db="z $HOME/DROPBOX"
alias dbrep="z $HOME/DROPBOX/REPOS"
alias dbleaf="z $HOME/DROPBOX/OVERLEAF"

# General dirs --
alias home="z $HOME"
alias desk="z $HOME/Desktop"
alias dl="z $HOME/Downloads"

# Current projects --
alias cbox="z $HOME/DROPBOX/REPOS/codebox"
alias dot="z $HOME/DROPBOX/REPOS/mydots"

# Aliases -----
alias -- -='z -' # note we need -- since command begins with -
alias b='bat --style=grid,numbers'
alias bat='bat --style=grid,numbers'
alias cd='z' # use zoxide as the default
alias ..='z ..'
alias ...='z ../..'
alias ....='z ../../..'
alias .....='z ../../../..'
alias ......='z ../../../../..'
alias .......='z ../../../../../..'
alias cp='cp -r'
alias cpi='cp -iv'
alias df='df -kH'
alias dus='du -sckx * | sort -nr'
alias ed='open -a /Applications/Emacs.app'
alias g=git
# alias history=omz_history
alias jn="jupyter notebook"
alias jl="jupyter lab"
alias ls='exa --color=always --group-directories-first --icons'
alias l='exa -l --color=always --group-directories-first --icons'
alias ll='exa -la --color=always --group-directories-first --icons'
alias lh='exa -lah --color=always --group-directories-first --icons'
alias lg='lazygit'
alias lgc='lazygit;clear;'
alias less='less -R'
alias md='mkdir -p'
alias rmi='rm -i'
alias rmf='rm -rf'
alias rs='open -a /Applications/RStudio.app .'
alias sc="source $HOME/.config/zsh/.zshrc" # source ~/.zshrc
alias tree="exa --tree --all --group-directories-first -I '.git|.svn|.hg|.idea|.vscode|.Rproj.user|.pytest_cache'"
alias t1="tree --level=1"
alias tl1="t1 --long"
alias t2="tree --level=2"
alias tl2="t2 --long"
alias t3="tree --level=3"
alias tl3="t3 --long"
alias t4="tree --level=4"
alias tl4="t4 --long"
alias top=htop
alias ttop='top -ocpu -R -F -s 2 ln30'
alias v='nvim'
alias vc='nvim;clear;' # clear screen, to clean terminal after closing nvim
alias vh='nvim .' # nvim 'here', i.e., in the current directory.
alias vhc='nvim .;clear;' # clear screen, to clean terminal after closing nvim

# subversion alias 
# source: running `xdg-ninja` in `$HOME` gave this suggestion
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"

# pyenv and pyenv-virtualenv related
alias p='pyenv which python;clear;'
alias pv='pyenv version'
alias pvg='pyenv global'
alias pvl='pyenv local'
alias pvi='pyenv install'
alias pvu='pyenv uninstall'
alias pvs='pyenv versions'
alias pwp='pyenv which python'
alias bp='bpython'

# benchmarking
alias zbench='hyperfine "/usr/bin/time zsh -lic exit;" --warmup 5' # zsh
alias vbench='hyperfine "nvim --headless +qa" --warmup 5' # nvim

# Additional clean/wash aliases --
# Source: https://github.com/ameensol/shell/blob/master/.zshenv#L29-L30
# clean up current directory
alias clean="find . -maxdepth 1 -name '*.DS_Store' -o -name '*~' -o -name '.*~' -o -name '*.swo' -o -name '*.swp' -o -name '.*.swo' | xargs rm"

# clean up current directory AND all subdirectories
alias wash="find . -name '*.DS_Store' -o -name '*~' -o -name '.*~' -o -name '*.swo' -o -name '*.swp' -o -name '.*.swo' | xargs rm"

# Application open suffix alias --
# Source:
# https://github.com/sdaschner/dotfiles/blob/91f9578b6cf926efb06bb3b1ebbd1ccd0715e06d/.aliases#L327-L336
# Note: For macOS we use `open -gj` to open the application in the background
alias -s {pdf,PDF}='open -gja Skim.app'
alias -s {jpg,JPG,png,PNG}='open -gja Preview.app'
alias -s {ods,ODS,odt,ODT,odp,ODP,doc,DOC,docx,DOCX,xls,XLS,xlsx,XLSX,xlsm,XLSM,ppt,PPT,pptx,PPTX,csv,CSV}='open -gja LibreOffice.app'
alias -s {html,HTML}='open -gja Google\ Chrome.app'
alias -s {mp4,MP4,mov,MOV,mkv,MKV}='open -gja VLC.app'
alias -s {zip,ZIP,war,WAR}="unzip -l"
alias -s gz="tar -tf"
alias -s {tgz,TGZ}="tar -tf"

