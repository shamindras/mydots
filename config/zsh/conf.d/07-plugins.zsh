#Handle plugins using antidote.
# source: https://getantidote.github.io/install#ultra-high-performance-install

# You can change the names/locations of these if you prefer.
# antidote_dir=${ZDOTDIR:-~}/.antidote
# plugins_txt=${ZDOTDIR:-~}/library/.zsh_plugins.txt
# static_file=${ZDOTDIR:-~}/library/.zsh_plugins.zsh
#
# # Clone antidote if necessary and generate a static plugin file.
# if [[ ! $static_file -nt $plugins_txt ]]; then
#   [[ -e $antidote_dir ]] ||
#     git clone --depth=1 https://github.com/mattmc3/antidote.git $antidote_dir
#   (
#     source $antidote_dir/antidote.zsh
#     [[ -e $plugins_txt ]] || touch $plugins_txt
#     antidote bundle <$plugins_txt >$static_file
#   )
# fi
#
# # Uncomment this if you want antidote commands like `antidote update` available
# # in your interactive shell session:
# autoload -Uz $antidote_dir/functions/antidote
#
# # source the static plugins file
# source $static_file
#
# # cleanup
# unset antidote_dir plugins_txt static_file


# You can also separate the clone and load portions for more advanced plugin loads

# where should we download your Zsh plugins?
ZPLUGINDIR=${ZDOTDIR:-$HOME/.config/zsh}/plugins

# declare a simple plugin-clone function, leaving the user to load plugins themselves
function plugin-clone {
  local repo plugdir initfile initfiles=()
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) && ln -sf $initfiles[1] $initfile
    fi
  done
}

# .zshrc

# Clone zsh_unplugged and use it as a micro plugin manager.
[[ -d $ZDOTDIR/.unplugged ]] ||
  git clone https://github.com/mattmc3/zsh_unplugged $ZDOTDIR/.unplugged
source $ZDOTDIR/.unplugged/zsh_unplugged.zsh

# clone-only plugins
plugin-clone romkatv/zsh-bench
path+=$ZPLUGINDIR/romkatv/zsh-bench

# load plugins
plugins=(

  # regular plugins
  # mattmc3/zman
  # mattmc3/zsh-safe-rm

  # Uncomment to use your local plugins
  # Put these in $ZDOTDIR/plugins
  # my_plugin
  # python

  # do completions
  zsh-users/zsh-completions

  # Deferred plugins may speed up your load times even more.
  # Once you load romkatv/zsh-defer, everything after gets deferred.
  romkatv/zsh-defer
  # olets/zsh-abbr
  zdharma-continuum/fast-syntax-highlighting
  zsh-users/zsh-autosuggestions
  # zsh-users/zsh-history-substring-search
)
plugin-load $plugins
