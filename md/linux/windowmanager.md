<div>

</div>

# Window Manager

In lubuntu, the default WM is openbox. Openbox handles:

1.  The window borders, decorations, placement
2.  what is triggered with keybindings, clicks
3.  the menu icons, text and arrangement
4.  session start

The first two can be found on the config file for openbox. You should
copy the file from /etc/xdg/openbox/rc.xml to \~/.config/openbox/rc.xml
to edit it, if that file does not already exist. The file contains a ton
of options. Most interesting stuff is keybindings. Again with a myriad
of options.

The third one is managed by openbox-menu, don\'t know where the config
file is, but right clicking on it there is a \'configure panel\' option.
We can customize the app itself and also the applications (widgets)
running on it. **A good alternative could be to autostart dmenu.**

After installing openbox, or if it comes installed, a new session option
is available for us. It is a complex thing and I don\'t know more than
this.

### Source

[Openbox Hotkeys Wiki](http://openbox.org/wiki/Help:Bindings)
