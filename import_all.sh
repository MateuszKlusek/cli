#!/bin/zsh

# import in zshrc
# before import initialize url
# url is a path in a format to /dir1/dir2/dir3/*
for file in url
	do 
		if [[ $file == *.sh ]]
		then 
			if [ -f $file ]; then
				source $file 
			else
				echo "404: not found"
			fi
		fi
done