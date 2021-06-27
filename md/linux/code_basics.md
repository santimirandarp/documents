## Parameter expansion
Is the replacement of a variable, by its value.

There are pre-set variables, and others we define. Examples of the former are `$0`, `$#`, `$@`. These expand to current script name, number of arguments, and list of arguments. It is recommended to surround expansions with quotes. Let's see why. 

We want to run `rm $file` where file="my nice file". This results in `rm my nice file` interpreted as 3 files. We should run `rm "$file"`. Not `rm '$file'` as this will look for a file named $file.

Examples of the latter (from the first paragraph) are custom variables, as the one we define before (`file`).

A very nice way to remember expansion, is by assigning the meaning to `$`, which indeed, is the expansion command.
