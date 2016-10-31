#!/bin/bash

for s in .vimrc .vim .git-prompt.sh .bash-ps1.sh .bash_profile .bashrc .gitconfig
do
	original="/Users/ksmandersen/Code/ksmandersen/dotfiles/$s"
	target="/Users/ksmandersen/$s"
	if [ ! -L $target ]; then
		echo $original
		ln -s $original $target
	fi
	# echo $target
done


#ln -s ~/Projects/dotfiles/.vimrc ~/.vimrc
#ln -s ~/Projects/dotfiles/.vim ~/.vim

#ln -s ~/Projects/dotfiles/.git-prompt.sh ~/.git-prompt.sh
#ln -s ~/Projects/dotfiles/.bash-ps1.sh ~/.bash-ps1.sh

#ln -s ~/Projects/dotfiles/.bash_profile ~/.bash_profile
#ln -s ~/Projects/dotfiles/.bashrc ~/.bashrc
