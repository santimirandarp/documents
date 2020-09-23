# SysTools
Once we open up a terminal, we need to know what to do. The first step is to memorize a set of useful commands. 

**The history Command**

`history` displays the content of `~/bash_history` on the screen.

We can get the line number of a command and run `!line number`, to repeat a command. We can run `^C1^C2^` to replace C1 by C2 on the last command. And we can issue `!!` to re-run the last command on history.

```
history
history | grep "hello"
man history
^man^whatis^
!!
```
**Explore directories**

* pwd to know where we are
* tree for a directory tree-structure
tree is normally executed as `tree -L 1` or `tree -L 2` where 1,2 is the depth of the output.

**Explore files**

* head file
* history | tail
* cat filename|less
* less filename 

`tail history` won't work. `history` is not a file but a program.

**Get Help!**

```
man command
tldr command
apropos smth
```

`apropos` takes a word as argument, and retrieves programs related to that word.

**Find Files**

* find where -name filename

*where* should be replaced by a suitable directory.

* locate filename

Is another useful option.

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

* ifconfig (all network cards info)
* iwconfig (wireles card info)
* lsusb (list usb devices)
* lspci (list pci devices: *cards*, usbs, etc)
* lsblk (list disks attached)
* htop (process viewer)
* journalctl
* systemdctl

htop or the old variant top opens up a process viewer, where we can identify a particular problem causing troubles, or consuming loads of RAM. Programs can be exited issuing kill PID in the command line. Also `killall programname`

