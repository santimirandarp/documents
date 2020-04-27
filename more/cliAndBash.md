# Shell Commands and Bash scripting

Search on the history file (~/bash_history)

history | grep [-options] 'string' --> get the line number

Execute `!line number`


## EXPLORE FILES

history | head  // takes only first lines (i.e old ones) of the stout.
history|tail
cat filename|less
less filename // similar effect!

## LAST TIME FOR A COMMAND
!command --> executes the command as the last time.
useful !sass

##  LAST COMMAND
!! --> last command.

ex: sudo !!

Example:
/home/Desktop/santi
cd !! 

## ALIASES
define on ~/.bash_aliases
alias name='something/like/a/path'

## SYMLINKS
it's a file (folder or file) that acts like the original linked document.
we run ln -s path/to/fileOrFolder /where/to/place/it 
It's different and more powerful than aliases.

## GET HELP 
man command
tldr command
example: tldr find or tldr grep

## FAST TRICKS
ctrl+l to clear the cli
ctrl+u to remove (undo) the typed command

## A FEW RANDOM COMMANDS
ifconfig for network info
iwconfig for wireless connection info
lsusb list hardware/media connected to the computer
htop cool command line process viewer
