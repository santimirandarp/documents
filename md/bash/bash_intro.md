# Bash

From the user point of view a programming language consist on a script plus an interpreter (or program). The program that runs the script is either python, node, bash, etc. depending on the language we wrote the script. Bash then, is a scripting language and an interpreter.

## Bites of Bash

-   Bash interacts effectively with the system.
-   Terminal Emulators are normally programs running a Bash interpreter.
    (but there are others.)
-   Check your bash version running: `echo $0`.
-   There are terminal emulators running other languages (like Python)
    instead of Bash.

If we type `cd ourdir` on the terminal, this is interpreted by bash when
we press [Enter]{.kbd}.

We can run bash *the normal way* too. This is, running a script.

## Run a script

We could write the following code in `example.sh` file:

    #!/bin/env bash 
    echo "Hello World" 

Execute it by issuing `bash example.sh`. The first line tells the
computer which interpreter to use.

For Python:

    #!/bin/env python 
    print("Hello World")

And run `python example.py`.

You\'ll see people running `./scriptname` instead. That\'s how an
executable is run. If we list the files `ls -l` we see there are no
execution permissions, so the program won\'t run. We need to modify file
permissions to be executable.

Run `sudo chmod +x filename`, to make \'filename\' executable.
