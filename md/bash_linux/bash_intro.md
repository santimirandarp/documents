# Bash
From the user point of view a programming language consist on a script plus an interpreter. The interpreter that plays the script is either python, node, bash, etc. depending on the language we write the script. Bash then, is a scripting language and an interpreter. We use it to interact with the system.  To see which terminal we have run: echo $0. Normally, we should get `/bin/bash`.  

It's sometimes confusing that we can use bash to easy-run system binaries while other languages are not so common for those tasks. However, this can be achieved with any language. There are python terminals, or you can open a python interpreter on the terminal.  Linux terminal runs, by default, a bash interpreter.

If we type `cd ourdir` on the terminal, this is interpreted by bash when we press enter. We can think of the terminal as a 'file' where we write the code.

We can run bash _the normal way_ too. Just write a bash script and run `bash filename.sh` on the terminal.

## Run a script
We could write the following code in `example.sh` file: 

``` 
#!/bin/bash 
echo "Hello World" 
``` 
Execute it by issuing `bash example.sh`.  You'll find the very first line in most languages. It tells the computer which interpreter to use.  For python:

```
#!/bin/env python 
print("Hello World") 
```
And run `python example.py`. 

You'll see people running `./scriptname` instead. That's how an executable is run. If we list the files `ls -l` we see there are no execution permissions, so the program won't run. We need to modify file permissions to be executable. 

Run `sudo chmod +x filename`, to make 'filename' executable.

## PATH variable
Most custom scripts should be under `~/bin` or `~/.local/bin`. Then we can add this dir to *$PATH* if it's not already there. Now we can run it as `scriptname` (needs to be an executable). 

