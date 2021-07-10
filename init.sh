#!/bin/bash

# Install pathogen
#mkdir -p autoload bundle
#curl -LSso autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
curl -fLo autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Pull plugins
git pull && git submodule init && git submodule update && git submodule status

cd bundle
cat ../plugins.txt | xargs -L1 git clone
cd ..

# Link up our vimrc file
SRCF=$(pwd)/.vimrc
ln -s "$SRCF" ~/.vimrc
