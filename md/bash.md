# Bash
From the user point of view a programming language consist on a script plus an interpreter. The interpreter that plays the script is either python, node, bash, etc. depending on the language we write the script. Bash then, is a scripting language and an interpreter. We use it to interact with the system.  To see which terminal we have run: echo $0. And we should get /bin/bash.  

It's sometimes confusing that we can use Bash to change, list, rename files/directories and run programms while other languages are not so common for those tasks.

However, this can be achieved with any language. There are python terminals, or you can open a Python interpreter on the terminal.  The terminal is, by default, a Bash interpreter.


If we run `cd ourdir` on the terminal, this is interpreted by bash when we press enter. We can think of the terminal as a 'file' where we write the code, with the advantage we get some output. 

We can run bash _the normal way_ too, i.e we can run a file filled up with bash scripting as `bash filename.sh` on the terminal.

## Run a script
As an example of a bash script in a file we could write the following code: 

``` 
#!/bin/bash 
echo "Hello World" 
``` 
We execute this as `bash example.sh`.  You'll find the very first line in most languages. It tells the computer which interpreter to use.  For Python `python example.py` will be: 

```
#!/bin/env python 
print("Hello World") 
```

We could ask whats the point for the very first line if we are calling the executer (bash, python) either 
way.

There is an extra step we can take here, and this is to add the script's directory to the PATH variable. 
All custom scripts should be under `~/bin` or `~/.local/bin`. Then we can add this dir to $PATH if it's not already there.

In this case we need to modify permissions, and then we can run our script using `scriptname`, just like any other program on the $PATH!

If we list the files `ls -l` we can see there are no execution permissions, so the program won't run.

Run sudo chmod +x “filename”, to make 'filename' executable!

-----------------------

## Programming

### Variables
```bash
string="my string"
array=("elements" *.txt "globs")
echo ${string} 
```
The `${}` is optional, but it's very useful if the string:

* has a `-` to avoid being confused with a command's flag.
* to avoid globbing (\*), in case it contains a wildcard. 

${string} is better than $string, but sometimes it's just not necessary.

Normally variables are uppercase $STRING but it's not a requisite.

### Loops

```
for element in "${array[@]}"
do 
#comands here
done
```
A few useful bits:
"${array[@]}" makes element="${array[i]}" each time.
"${!array[@]}" makes element= array index each time.


### Switches

### Functions


## SysTools

Search on the history file (~/bash_history)
history | grep [-options] 'string' --> get the line number
Execute `!line number`


* Explore the file
history | head  // takes only first lines (i.e old ones) of the stout.
history|tail
cat filename|less
less filename // similar effect!
* !name will execute the last instance of name. Example: !vim
* !! --> last command.  ex: sudo !!
* Aliases
define on ~/.bash_aliases
alias name='something/like/a/path'
* Symlinks
It's a file (folder or file) that acts like the original linked document.
we run ln -s path/to/fileOrFolder /where/to/place/it 
It's different and more powerful than aliases.
* Help
```
man command
tldr command
```
* Terminal Shortcuts
```
C + l to clear the cli
C + u to remove (undo) the typed command
C + a beginning of line
C + e end of line.
```
* A few random commands
ifconfig for network info
iwconfig for wireless connection info
lsusb list hardware/media connected to the computer
lspci list pci devices (cards, keyboard, usbs, etc)
lsblk list disks attached
htop process viewer

# Some gnu utilities

* cat head tail less
* find (file)
* grep (find in file or STDOUT)
* grep prints to stdout so it can be redirected like so
* *.txt | grep Hello >> find.txt
* sed change/write file
* apt dist-upgrade (full upgrade, also the kernel).
* wget url/fileToDownload/etc
* systools: watch, dmesg, journalctl, syslog, lsblock, lspci, fdisk, e4defrag, crontab/cron
* shutdown  -h 20 (shutdown at a specific hour), reboot, etc.
* shutdown -c to cancel the shutdown.
* crontab -e to edit, cron runs commands at specific times of the day for us.

