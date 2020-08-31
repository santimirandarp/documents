#!/bin/bash
#quotes
echo '$0literal'
echo "$0-notliteral"
#Single quotes won't treat variables as variables but as words
#Double quotes will allow you to do substitution (that is include variables within the setting of the value).

#Variables in Bash
	#never leave blank spaces around the = sign in bash
replacement="WORLD~" # "" for string
singer=(joan manuel serrat) # () for array
bettersinger=("joan" "manuel" "serrat")
#command substitution
	#saves an output of  command in a variable.
myvar=$( ls . | wc -l )
echo "number of dirs is %d" "$myvar"
#Arrays and iteration.

#iterate over elements
for name in "${singer[@]}" 
do
	echo "$name"
done

# Iterate over the indexes.
#for idx in "${!singer[@]}" 
#do
#	printf "Singer name %d is %s\n" "$idx" "${singer[idx]}"
#done

#Loops using globbing
#loops
#for file in *.txt; do   
#    echo "$file" 
#done
##That's ok but problem is that, even if there are no .txt files, the loop runs once.
for file in *.txt; do
	[ -e "$file" ] || continue #if the test is false, it goes on to continue (it doesnt otherwise) and jumps off the loop.
    echo "$file"
done


