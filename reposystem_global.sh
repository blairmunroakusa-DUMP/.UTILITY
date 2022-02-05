#! /bin/bash

ROOT=$HOME/_ROOT/
TRUNK=$HOME/_ROOT/_TRUNK/
BRANCH=$HOME/_ROOT/__BRANCH/
LEAF=$HOME/_ROOT/___LEAF/

LAYERS=($ROOT $TRUNK $BRANCH $LEAF)


# add commit push global reposystem changes
function acp_global {
	for layer in "${LAYERS[@]}"
	do
		for directory in $layer*/
		do
			if [ -d $directory.git/ ]
			then
				cd $directory
				git add .
				git commit -m "global update"
				git push -u origin master
			fi
		done
	done
}

# pull global reposystem changes
function pull_global {
	for layer in "${LAYERS[@]}"
	do
		for directory in $layer*/
		do
			if [ -d $directory.git/ ]
			then
				cd $directory
				git pull --rebase
			fi
		done
	done
}

# update global reposystem submodules
function submod_global {
	for layer in "${LAYERS[@]}"
	do
		for directory in $layer*/
		do
			if [ -d $directory.git/ ]
			then
				cd $directory
				git submodule update --remote --merge
			fi
		done
	done
}
