# The pieces: Desktop

Lubuntu has an Ubuntu core system, LXQt Desktop Environment allowing startup apps and its configuration where we can configurate any
manager as window managers, login managers; comes with Openbox window manager, Openbox Menu, ssdm login manager, Alsa as a sound manager, Network Manager.  

All this can be changed, even the Desktop Environment.

In any distro, for example Ubuntu, we can install the server with different desktop environments, and also tweak all the previous managers. It's a nice exercise to try.

## app.desktop files

Normally, when on the CLI, we specify what program opens a file. But on desktop there is also a default. We click a file, and it is opened with a program.

This is an example of how to set up inkscape to open png images: `xdg-mime default inkscape.desktop image/png`

Where **inkscape.desktop** is the program desktop entry, and *image/png* is the mimetype of a file. Now click on an image, it opens with inkscape.

Most programs don\'t really use the extension to determine what a file\'s contents are, but the MIME, media type or mimetype. For a text file it would be text/plain. We can determine this using `xdg-mime query mimetype FILE`

## app.desktop files? 

Desktop entries (files) that point to a binary. What really runs is `xdg-open`, which is a program we can also run from terminal. xdg is related to the desktop.

The desktop entries are created when we install a program, but we can now set and change it.

XDG is not the only program used for setting this type of task. There is exo, gnome, kde and many others depending on the distribution.

## Go GUI

Many times there is a GUI interface where we can just click \'default application\' for example \'default browser\' and we will get the same
result.

For help type `man xdg-mime` on the terminal.


