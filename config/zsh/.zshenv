# Define Zsh environment variables.
# source: https://github.com/mattmc3/zebrafish/blob/a5808bf655d604a48ac8bc58d47c4aac955475e9/zebrafish.zsh
# source: https://github.com/dylanjm/teton/blob/2eb03539fe2c9489ed6b5ade4ee4ee44d8c6f421/config/shells/zsh/zshenv.zsh 

# Even with `$ZDOTDIR` set ~/.zshenv needs to remain.
# But, you can symlink it to this file
# ln -s ~/.config/zsh/.zshenv ~/.zshenv
export ZDOTDIR=${ZDOTDIR:-~/.config/zsh}

#region Environment
#
# https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/index.php/XDG_Base_Directory
# https://wiki.archlinux.org/index.php/XDG_user_directories
# https://github.com/zshzoo/environment
#
# XDG paths
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_BIN_HOME="${HOME}/.local/bin"
export CACHE="${XDG_CACHE_HOME}"
export XDG_RUNTIME_DIR="${HOME}/.xdg"

# os specific vars
if [[ "$OSTYPE" == darwin* ]]; then
  export XDG_DESKTOP_DIR=${XDG_DESKTOP_DIR:-~/Desktop}
  export XDG_DOCUMENTS_DIR=${XDG_DOCUMENTS_DIR:-~/Documents}
  export XDG_DOWNLOAD_DIR=${XDG_DOWNLOAD_DIR:-~/Downloads}
  export XDG_MUSIC_DIR=${XDG_MUSIC_DIR:-~/Music}
  export XDG_PICTURES_DIR=${XDG_PICTURES_DIR:-~/Pictures}
  export XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-~/Videos}
  export XDG_PUBLICSHARE_DIR=${XDG_PUBLICSHARE_DIR:-~/Public}
  export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-~/Projects}
fi

# Encoding
export LANGUAGE=${LANGUAGE:-en}
export LANG=${LANG:-en_US.UTF-8}
export LC_ALL=${LC_ALL:-en_US.UTF-8}

# Editor and paging
export EDITOR=${EDITOR:-nvim}
export VISUAL=${VISUAL:-nvim}
export PAGER=${PAGER:-less}
export LESS=${LESS:-'-g -i -M -R -S -w -z-4'}
export TERMINAL="alacritty"
export COLORTERM="truecolor"

# Regional settings.
export TZ="America/New_York"

# colors
export LS_COLORS=${LS_COLORS:-'di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'}
export LSCOLORS=${LSCOLORS:-exfxcxdxbxGxDxabagacad}
export CLICOLOR=${CLICOLOR:-1}

# use `< file` to quickly view the contents of any file.
export READNULLCMD=${READNULLCMD:-$PAGER}

# remove lag
export KEYTIMEOUT=${KEYTIMEOUT:-1}

# treat these characters as part of a word
export WORDCHARS=${WORDCHARS:-'*?_-.[]~&;!#$%^(){}<>'}

# show man pages in color
export LESS_TERMCAP_mb=$'\e[01;34m'      # mb:=start blink-mode (bold,blue)
export LESS_TERMCAP_md=$'\e[01;34m'      # md:=start bold-mode (bold,blue)
export LESS_TERMCAP_so=$'\e[00;47;30m'   # so:=start standout-mode (white bg, black fg)
export LESS_TERMCAP_us=$'\e[04;35m'      # us:=start underline-mode (underline magenta)
export LESS_TERMCAP_se=$'\e[0m'          # se:=end standout-mode
export LESS_TERMCAP_ue=$'\e[0m'          # ue:=end underline-mode
export LESS_TERMCAP_me=$'\e[0m'          # me:=end modes
#endregion

# History
export HISTDB_FILE="${XDG_DATA_HOME}/zsh-history.db"
export HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')

# $HISTFILE belongs in the data home
export HISTFILE="${XDG_DATA_HOME:-~/.local/share}/zsh/history"
[[ -f "$HISTFILE" ]] || { mkdir -p "$HISTFILE:h" && touch "$HISTFILE" }

export HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=500000
export SAVEHIST=500000

# Cache
export CCACHE_DIR="${XDG_CACHE_HOME}/ccache"

# Conda
export CONDARC="${XDG_CONFIG_HOME}/condarc"

# FZF options
export FZF_DEFAULT_COMMAND='fd -HI -L --exclude .git --color=always'
export FZF_DEFAULT_OPTS='
  --ansi
  --info inline
  --height 40%
  --reverse
  --border
  --multi
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(bat --theme ansi-dark --color always {} 2> /dev/null || exa --tree --color=always {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'exa --tree --color=always {} | head -200'"

# Julia
export JULIA_NUM_THREADS=16
export JULIA_DEPOT_PATH="${XDG_DATA_HOME}/julia"

# Less
# TODO: uncomment the less options and see if they are useful given bat
export LESSHISTFILE="${XDG_DATA_HOME}/lesshst"
# export LESSOPEN='| /usr/bin/env lessfilter %s 2>&-'
# export LESS_TERMCAP_mb=$'\E[01;31m'    # begin blinking
# export LESS_TERMCAP_md=$'\E[01;31m'    # begin bold
# export LESS_TERMCAP_me=$'\E[0m'        # end mode
# export LESS_TERMCAP_se=$'\E[0m'        # end standout-mode
# export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'        # end underline
# export LESS_TERMCAP_us=$'\E[01;32m'    # begin underline

# Node
# source: https://blog.mitsunee.com/post/n-xdg-setup
export NVM_DIR="${XDG_DATA_HOME}/nvm"
export N_PREFIX="${XDG_DATA_HOME}/node"
export N_CACHE_PREFIX="${XDG_CACHE_HOME}"
export N_PRESERVE_NPM=1
export N_PRESERVE_COREPACK=1
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export COREPACK_HOME="${XDG_DATA_HOME}/corepack"
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node_repl/history"


# Python
export PYENV_ROOT="${XDG_DATA_HOME}/pyenv"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export PYLINTHOME="${XDG_CACHE_HOME}/pylint.d"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export MPLCONFIGDIR="${XDG_DATA_HOME}/matplotlib"
export MYPY_CACHE_DIR="${XDG_CACHE_HOME}/mypy_cache"
export PYGMENTIZE_STYLE='paraiso-dark'
export PYTHONDONTWRITEBYTECODE="TRUE" # TODO: toggle if reviewing bytecode

# R
export R_USER="${XDG_CONFIG_HOME}/R"
export R_ENVIRON_USER="${XDG_CONFIG_HOME}/R/Renviron"
export R_PROFILE_USER="${XDG_CONFIG_HOME}/R/Rprofile"
export R_MAKEVARS_USER="${XDG_CONFIG_HOME}/R/Makevars"
export R_HISTFILE="${XDG_DATA_HOME}/Rhistory"
# export R_LIBS_USER="${HOME}/Library/R/4.0/library"
export R_HISTSIZE=100000
export R_STARTUP_DEBUG=TRUE
export MKL_NUM_THREADS=16
export OMP_NUM_THREADS=16

# Rust/Cargo
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"

# Tealdeer
export TEALDEER_CACHE_DIR="${XDG_CACHE_HOME}/tealdeer"
export TEALDEER_CONFIG_DIR="${XDG_CONFIG_HOME}/tealdeer"

# Terminfo
export TERMINFO="${XDG_DATA_HOME}"/terminfo
export TERMINFO_DIRS="${XDG_DATA_HOME}"/terminfo:/usr/share/terminfo

# Zoxide
export _ZO_DATA_DIR="${XDG_DATA_HOME}/zoxide"
export _ZO_ECHO=0
export _ZO_MAXAGE=100

# Set the list of directories that cd searches
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  $CARGO_HOME/bin               # Rust CLI Utils
  $PYENV_ROOT/bin               # Pyenv CLI Utils
  $PYENV_ROOT/shims             # Python Libraries
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

# macOS
if [[ "$OSTYPE" == darwin* ]]; then
  export SHELL_SESSIONS_DISABLE=1
fi
