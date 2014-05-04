#!/bin/bash

mkdir -p autoload bundle
curl -LSso autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
git pull && git submodule init && git submodule update && git submodule status
SRCF=$(pwd)/.vimrc
ln -s "$SRCF" ~/.vimrc
