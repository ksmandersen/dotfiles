#!/bin/bash

symfiles=( .vimrc .vim .git-prompt.sh .bash-ps1.sh .bash_profile .bashrc)

for s in "{symfiles[@]}"
do
	$source="~/Projects/dotfiles/$s"
	$target="~/$s"
	if [ ! -L $target ]; then
		ln -s $source $target
	fi
done


#ln -s ~/Projects/dotfiles/.vimrc ~/.vimrc
#ln -s ~/Projects/dotfiles/.vim ~/.vim

#ln -s ~/Projects/dotfiles/.git-prompt.sh ~/.git-prompt.sh
#ln -s ~/Projects/dotfiles/.bash-ps1.sh ~/.bash-ps1.sh

#ln -s ~/Projects/dotfiles/.bash_profile ~/.bash_profile
#ln -s ~/Projects/dotfiles/.bashrc ~/.bashrc
