#!/bin/bash

for s in .vimrc .vim .git-prompt.sh .bash-ps1.sh .bash_profile .bash_completion .bashrc .inputrc .gitconfig .gitexcludes .hyper.js git-completion.bash
do
	original="/Users/ksmandersen/Code/ksmandersen/dotfiles/$s"
	target="/Users/ksmandersen/$s"
	if [ ! -L $target ]; then
		echo $original
		ln -s $original $target
	fi
	# echo $target
done

