# How is the default software set?

Let's say we double click on a file. It could be an image, or a text file. How does linux decide which one?

First of all, there are probably many defaults that the distro specifies. But apart from that we can change those in many ways. I know of at least 2:

1. using xdg-mime
2. editing mimeapps.list, under the [Default Applications] settings.

These are equivalent. In 1. we use a program to update **mimeapps.list**, in 2. we do it manually. 

## Using xdg-mime (or equivalent) 
This is an example of how to set up inkscape to open png images:
```
xdg-mime default inkscape.desktop image/png
```
Where inkscape.desktop is the program desktop entry, and image/png is the mimetype of a file. 

Most programs don't really use the extension to determine what a file's contents are, but the MIME, media type or mimetype. For a text file it would be text/plain. Again we can determine this using `xdg-mime query mimetype FILE`

## How and what are those app.desktop files?
Those are called desktop entries, and again, it's what opens up when we double click on a file, given that they are the default application for that MIME type. What really runs is `xdg-open`, which is a program we can also run from terminal.

The desktop entries are created when we install a program. But what if it's not? And anyways what are they?

(more stuff coming...)

### Other "Setter" Programs
XDG is not the only program used for setting this type of task. There is exo, gnome, kde and many others depending on your distribution.

## Go GUI
Many times there is a GUI interface where we can just click 'default application' for example 'default browser' and we will get the same result.

For help type `man xdg-mime` on the terminal.
