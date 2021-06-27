<div>

</div>

# Where do programs live in linux?

There are many package installers now. There is the traditional
installers and snap, flatpack, umake. We can divide installations in 2
groups according to permissions:

Sudo, cross-user installed programs (binary files) sit on `/usr/bin` or
`/usr/local/bin`. Also `/snap/bin` for snap-installed packages. `/bin`
and `/sbin` are the bare bones of linux and programs shouldn\'t be
there. Sudo is needed on those programs exactly for the sake of putting
the program and dependencies on the root directory structure. This are
global-scoped installations.

User scoped installations follow the similar paths `~/.local/bin`. This
installation do not require sudo powers. `umake` installed packages sit
on `/home/santi/.local/share/umake/bin`.

Some programs might ask for adding a the address to the \$PATH variable,
after putting the binary files somewhere. Of course we can put the
binaries on `/usr/bin` or `~/.local/bin` and all should be good. In case
we add a new directory, the path to the bin can be set into `~.profile`
or changing `/etc/environment     `. In any case afterwards
\<`source ~.profile` or `source /etc/environment     ` has to be run to
activate the changes. If we change ` /etc/environment` it might be
necessary to source the profile anyways. We can check that typing
`echo $PATH` on the terminal.

### Another Anomaly

If we do not write `sudo npm 'node_module_name' `, and this might be a
good idea as we don\'t know how safe node is, the packages will be in
the user directory `~/node_modules/bin`. My Laptop for example contains
*gulp, sass and live-server*. This is important because for running
those commands we need to add that directory to the \$PATH variable!

## Firefox

Developer Edition is installed with umake, installed with apt. Then the
path must be added to the path variable and as the programm is
user-scoped the variable should be declared accordingly. So the proper
place is \~/.profile and remember we have to use export. There is a
warning that populates the screen. It can be solved using
`sudo apt-get remove fcitx; sudo apt-get autoremove `. Then the warning
dissapears and everything seems to work fine.
