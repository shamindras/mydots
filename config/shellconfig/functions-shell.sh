#!/usr/bin/env bash

# create a new directory, and cd into it
# source: https://stackoverflow.com/a/74904174/4687531
function mcd (){
    mkdir -p -- "$1" &&
    z "$1"
}

# create gitignore file for single/multiple languages
# use as follows: gi macos,R,Python,VisualStudioCode >> .gitignore
# source: https://docs.gitignore.io/install/command-line#linux-zsh
function gi() { 
    curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;
}

