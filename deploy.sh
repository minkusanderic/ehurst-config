#!/bin/bash

#install script to setup my own personal configs


sudo apt-get install zsh
sudo apt-get install vim

files="zshrc vimrc bashrc"

mkdir -p ~/.old_configs


for file in $files; do
	echo "Seting up .$file"
	mv ~/.$file ~/.old_configs/$file
	ln -s `readlink -f .$file` `readlink -f ~/.$file`
done
