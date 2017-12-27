#!/bin/bash
ls bundle > old_plugins

cd bundle
git clone "$1"
cd ..

ls bundle > new_plugins
plugin_name="$(comm -13 old_plugins new_plugins)"
rm old_plugins new_plugins

echo "$1" >> plugins.txt
echo "bundle/$plugin_name" >> .gitignore
