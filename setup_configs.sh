#!/bin/bash

#install script to setup my own personal configs


sudo apt-get install zsh
sudo apt-get install vim

file="zshrc"

for file in $files; do
	ln -s ./$file ~/.$file
