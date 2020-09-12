# Programming
There are many reasons to prefer Linux to other OS. First, most binaries are Open Source; second, those binaries are great for automation. On the other hand, the UI is not great.

To make the most of Linux we need bash. Let's look into it. 

## Variables
A variable is a handy name for a piece of data.
```bash
DOG="Woof"
DOGS=("Woof" *.dogs "Wolves")
PERMISSIONS=$(ls -l)
echo ${PERMISSIONS} 
```
The first one is a string, the second one an array, the third one is the output of a command. Finally we run a command inside the script. Echo prints the value associated with PERMISSIONS.

The `${}` is optional, but it's very useful if the replaced variable:

1. contains a `-`, to avoid being confused with a command's flag.
2. contains a (\*), to avoid expansion.

${variable} is better than $variable, but sometimes it's just not necessary. Normally variables are uppercase ${STRING} but it's not a requisite.

## Conditionals

## Loops
Looping is an operation run on iterables. For example, arrays are iterables:
```
for element in "${array[@]}"
do 
#comands here
done
```
A few useful bits:
"${array[@]}" makes element="${array[i]}" each time.
"${!array[@]}" makes element= array index each time.


## Switches

## Functions

