<div>

</div>

# Variables, Symlinks, Aliases

## Setting a Variable in Linux

Every now and then we have to set up a variable. There are many ways to
do it.

1.  `MYVAR=name` sets up a session variable (useful on the same
    terminal). ex: LINUX=\'cd \~/a/b/c\' and executed as \$LINUX.
2.  for user-scoped `~/.bashrc`, `~/.profile/` etc. `export MYVAR=name`.
3.  System wide, persitent can be set on `/etc/profile` as
    ` export MYVAR=name`
4.  System Wide, persistent are also set on `/etc/environment/`

Some system wide stuff can be found at `/etc/bash.bashrc`. This file is
overwritten by user-scoped bash config file (bashrc). I\'ve changed the
way it outputs the PS1 which is the prompt, so it doesn\'t prints the
absolute path, but only the last folder (pwd helps with the full path f
it is needed). This way the prompt is not overloaded of words.

### Sources

See https://www.tutorialspoint.com/unix/unix-environment.htm for help.

This type of variables are used by other programs. For example, when
typing **:edit** in *broot* the program invokes the \$EDITOR variable
that should be set to `/usr/bin/vim` or some editor.

The command **env** outputs all the environment variables. set prints
all the shell variables.

## Add a program to \$PATH

A very useful system variable is **PATH**. It stores, directories where
the system looks for a command everytime bash is executed.

\`echo \$PATH\` prints a **list** of directories it stores. To add one,
edit **.bashrc** by editing it like so:
\`PATH=/directory/to/add:\$PATH\`

On sass, for example, for global installing, the package can be
downloaded from github and then the file added to the path, where the
path points to the binary/program/executable. A similar installation is
using \`npm install -g sass\`

## Links

**Hard link** is essentially a second entry in the file system pointing
to the same data. If you create a hard link to a file, there is no sense
in which one of the links is the \"original\" file and the other is a
link. Change one, changes both.

**Soft link** is a separate file which points to another file via its
path, not to the pointer. If you delete a softlink with \"rm\" you are
deleting the link, not the thing it points to. To create a soft link
(hard links are not common), use \`ln -s source dist\`. Source is the
file towards dist will point. If we change the file name, or location,
it won\'t work anymore. To remove a soft link just remove the file. We
can check is something is a softlink by listing with the long flag,
using \`ln -l\`, and it will be obvious if it\'s a symlink.

**Alias** is like a softlink but even if we change the file name, it
will still work. It does not create and visible file, and it allows much
more functionality than a link (like executing commands). Type \`alias\`
to see all aliases, \`alias name=command\` to create one and \`unalias
aliasname\` to delete. For example, I have
\`\~/gits/documents/html/linux\` to the alias **linux**. Rename the file
to linux2, and the alias will still work, but not the symlink.

A common alias sometimes included in the .bashrc by default is \`alias
..=cd ..\`. There are many useful ones we can create just for our
particular use case.

Normally, I use only aliases either for changing dirs (cd) or some
recurrent, simple commands. For more complex commands we need bash
functions. If we are working with many directories deep into the
directory-tree, and we don\'t remember the names, we can set a few
symlinks on our home directory.

## Details

When commands is executed three files are open: stdin(0), stdout(1) and
stderr(2). Also, an exit code is generated \*\*but no output\*\*. It is
accessed as \$?, print using echo \$?. Counter intuitive: 0 sucessful,
unsucessful.

We can use the exit code in conditionals:

\`\`\` ls bash_aliases && echo \'find it!\' \|\| echo \'didnt find it!\'
\[ -n \$VARIABLE \] && echo \'exists\' \`\`\`

Output redirection: redirection of anything appearing on the terminal to
a file: firefox-developer 2 \> /dev/null

Processes: fg, bg, C-z: firefox-developer & \# the ampersand sets it as
a bg process.
