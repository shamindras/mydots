# Set apps to use XDG basedir spec.
# XDG basedir support outlined here:
# https://wiki.archlinux.org/index.php/XDG_Base_Directory

# Cache
export CCACHE_DIR="${CCACHE_DIR:-$XDG_CACHE_HOME/ccache}"

# Conda
export CONDARC="${CONDARC:-$XDG_CONFIG_HOME/condarc}"

# Julia
export JULIA_NUM_THREADS=16
export JULIA_DEPOT_PATH="${JULIA_DEPOT_PATH:-$XDG_DATA_HOME/julia}"

# jupyter
export JUPYTER_CONFIG_DIR="${JUPYTER_CONFIG_DIR:-$XDG_CONFIG_HOME/jupyter}"

# less
export LESSKEY="${LESSKEY:-$XDG_CONFIG_HOME/less/lesskey}"
export LESSHISTFILE="${LESSHISTFILE:-$XDG_CACHE_HOME/less/history}"
[[ -f $LESSHISTFILE ]] || { mkdir -p $LESSHISTFILE:h && touch $LESSHISTFILE }

# Python
export PYENV_ROOT="${PYENV_ROOT:-$XDG_DATA_HOME/pyenv}"
export IPYTHONDIR="${IPYTHONDIR:-$XDG_CONFIG_HOME/ipython}"
export PYLINTHOME="${PYLINTHOME:-$XDG_CACHE_HOME/pylint.d}"
export PYTHONSTARTUP="${PYTHONSTARTUP:-$XDG_CONFIG_HOME/python/pythonrc}"
export MPLCONFIGDIR="${MPLCONFIGDIR:-$XDG_DATA_HOME/matplotlib}"
export MYPY_CACHE_DIR="${MYPY_CACHE_DIR:-$XDG_CACHE_HOME/mypy_cache}"
export PYGMENTIZE_STYLE='paraiso-dark'
export PYTHONDONTWRITEBYTECODE="TRUE" # TODO: toggle if reviewing bytecode

# R
export R_USER="${R_USER:-$XDG_CONFIG_HOME/R}"
export R_ENVIRON_USER="${R_ENVIRON_USER:-$XDG_CONFIG_HOME/R/Renviron}"
export R_PROFILE_USER="${R_PROFILE_USER:-$XDG_CONFIG_HOME/R/Rprofile}"
export R_MAKEVARS_USER="${R_MAKEVARS_USER:-$XDG_CONFIG_HOME/R/Makevars}"
export R_HISTFILE="${R_HISTFILE:-$XDG_DATA_HOME/Rhistory}"
# export R_LIBS_USER="${HOME}/Library/R/4.0/library"
export R_HISTSIZE=100000
export R_STARTUP_DEBUG=TRUE
export MKL_NUM_THREADS=16
export OMP_NUM_THREADS=16

# Rust/Cargo
export CARGO_HOME="${CARGO_HOME:-$XDG_DATA_HOME/cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$XDG_DATA_HOME/rustup}"

# starship
export STARSHIP_CONFIG="${STARSHIP_CONFIG:-$XDG_CONFIG_HOME/starship/starship.toml}"
export STARSHIP_CACHE="${STARSHIP_CACHE:-$XDG_CACHE_HOME/starship/cache}"

# Tealdeer
export TEALDEER_CACHE_DIR="${TEALDEER_CACHE_DIR:-$XDG_CACHE_HOME/tealdeer}"
export TEALDEER_CONFIG_DIR="${TEALDEER_CONFIG_DIR:-$XDG_CONFIG_HOME/tealdeer}"

# Terminfo
export TERMINFO="${TERMINFO:-$XDG_DATA_HOME}"/terminfo
export TERMINFO_DIRS="${TERMINFO_DIRS:-$XDG_DATA_HOME}"/terminfo:/usr/share/terminfo

# Zoxide
export _ZO_DATA_DIR="${_ZO_DATA_DIR:-$XDG_DATA_HOME/zoxide}"
export _ZO_ECHO=0
export _ZO_MAXAGE=100

# gpg
export GNUPGHOME="${GNUPGHOME:-$XDG_DATA_HOME/gnupg}"
alias gpg="${aliases[gpg]:-gpg} --homedir \"\$GNUPGHOME\""

# Node
# source: https://blog.mitsunee.com/post/n-xdg-setup
export NVM_DIR="${NVM_DIR:-$XDG_DATA_HOME/nvm}"
export N_PREFIX="${N_PREFIX:-$XDG_DATA_HOME/node}"
export N_CACHE_PREFIX="${N_CACHE_PREFIX:-$XDG_CACHE_HOME}"
export N_PRESERVE_NPM=1
export N_PRESERVE_COREPACK=1
export NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG:-$XDG_CONFIG_HOME/npm/npmrc}"
export COREPACK_HOME="${COREPACK_HOME:-$XDG_DATA_HOME/corepack}"
export NODE_REPL_HISTORY="${NODE_REPL_HISTORY:-$XDG_STATE_HOME/node_repl/history}"

# postgres
export PSQLRC="${PSQLRC:-$XDG_CONFIG_HOME/pg/psqlrc}"
export PSQL_HISTORY="${PSQL_HISTORY:-$XDG_CACHE_HOME/pg/psql_history}"
export PGPASSFILE="${PGPASSFILE:-$XDG_CONFIG_HOME/pg/pgpass}"
export PGSERVICEFILE="${PGSERVICEFILE:-$XDG_CONFIG_HOME/pg/pg_service.conf}"

# readline
export INPUTRC="${INPUTRC:-$XDG_CONFIG_HOME/readline/inputrc}"
[[ -f $INPUTRC ]] || { mkdir -p $INPUTRC:h && touch $INPUTRC }

# ruby bundler
export BUNDLE_USER_CONFIG="${BUNDLE_USER_CONFIG:-$XDG_CONFIG_HOME/bundle}"
export BUNDLE_USER_CACHE="${BUNDLE_USER_CACHE:-$XDG_CACHE_HOME/bundle}"
export BUNDLE_USER_PLUGIN="${BUNDLE_USER_PLUGIN:-$XDG_DATA_HOME/bundle}"

# ruby gems
export GEM_HOME="${GEM_HOME:-$XDG_DATA_HOME/gem}"
export GEM_SPEC_CACHE="${GEM_SPEC_CACHE:-$XDG_CACHE_HOME/gem}"

# rust
export CARGO_HOME="${CARGO_HOME:-$XDG_DATA_HOME/cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$XDG_DATA_HOME/rustup}"

# screen
export SCREENRC="${SCREENRC:-$XDG_CONFIG_HOME/screen/screenrc}"
[[ -f $SCREENRC ]] || { mkdir -p $SCREENRC:h && touch $SCREENRC }

# tmux
export TMUX_CONFIG="${TMUX_CONFIG:-$XDG_CONFIG_HOME/tmux/tmux.conf}"
[[ -f $TMUX_CONFIG ]] || { mkdir -p $TMUX_CONFIG:h && touch $TMUX_CONFIG }
alias tmux='tmux -f "$TMUX_CONFIG"'

# wget
export WGETRC="${WGETRC:-$XDG_CONFIG_HOME/wget/wgetrc}"
[[ -f $WGETRC ]] || { mkdir -p $WGETRC:h && touch $WGETRC }
alias wget="${aliases[wget]:-wget} --hsts-file=\"\$XDG_CACHE_HOME/wget/wget-hsts\""
