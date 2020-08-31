# SysTools
Once we open up a terminal, we need to know what to do. The first step is to memorize a set of useful commands. 

**The history Command**

`history` displays the content of `~/bash_history` on STDOUT (screen). Level up using grep `history | grep [-options] 'string'` or fflags `history -c`. 

We can get the line number of a command and run `!line number`, to repeat a command. We can run ^C1^C2^ to replace C1 by C2 on the last command. And we can issue !! to re-run the last command on history.


**Explore the file**
* head file
* tail history
* cat filename|less
* less filename 

**Get Help!**

```
man command
tldr command
```

**Find Files**

* find where -name filename
* where should be replaced by a suitable directory.
* locate filename

**Operate Files and Move around**

* mv fileA fileB
* cp fileA fileB
* cd dirName

## Terminal Shortcuts

```
C + l to clear the cli
C + u to remove (undo) the typed command
C + a beginning of line
C + e end of line.
```
    
##  Troubleshooting

* ifconfig for network info
* iwconfig for wireless connection info
* lsusb list hardware/media connected to the computer
* lspci list pci devices (cards, keyboard, usbs, etc)
* lsblk list disks attached
* htop process viewer

## Some gnu utilities

* cat head tail less
* find (file)
* grep (find in file or STDOUT)
* *.txt | grep Hello >> find.txt
* sed change/write file
