#!/bin/bash

# Install pathogen
mkdir -p autoload bundle
curl -LSso autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Pull plugins
git pull && git submodule init && git submodule update && git submodule status

# Complexity analyzer has the vim module hidden inside the actual repo, ugh
ln -s pycomplexity/pycomplexity.vim bundle/

# Link up our vimrc file
SRCF=$(pwd)/.vimrc
ln -s "$SRCF" ~/.vimrc
