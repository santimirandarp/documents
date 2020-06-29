#!/bin/bash
#quotes
echo '$0literal'
echo "$0-notliteral"
#Single quotes won't treat variables as variables but as words
#Double quotes will allow you to do substitution (that is include variables within the setting of the value).

#How to declare a variable in Bash
replacement="WORLD~"

#Random example to learn
#thesource="$HOME/Desktop/thefile"
#thedestination="$HOME/Downloads/thefile"
#touch $thesource 
#cp $thesource $thedestination

#sometimes we want to
#POSIX shells such as Bash have the globbing feature specifically for this purpose -- to allow the shell to expand patterns into a list of matching filenames.
#for file in *.txt; do   
#    echo "$file" 
#done
##That's ok but problem is that, even if there are no .txt files, the loop runs once.


#command substitution
#saves an output of  command in a variable.
#example myvar=$( ls /etc | wc -l )
#Arrays and iteration.

singer=(joan manuel serrat)
for name in "${singer[@]}" 
do
	echo "$name"
done
#I mean: that rare syntax is expanded into something like this:
random="hello I am santi"
for word in $random
do
	echo "$word"
done

# Iterate over the indexes of "host".
#for idx in "${!singer[@]}" 
#do
#	printf "Singer name %d is %s\n" "$idx" "${singer[idx]}"
#done

#Loops with globbing in bash.
for file in *.txt; do
	[ -e "$file" ] || continue #if the test is false, it goes on to continue (it doesnt otherwise) and jumps off the loop.
    echo "$file"
done


