# Software Sources

## Software Sources {#linux-installation-methods}

Software Sources aka Package Repositories, it\'s the places where linux
look at to find programs. In the end, any of them is a web address
pointing to the `.deb` files. There are 3 main software sources (repos
etc) depending on the web host.

Official
:   Official repos, default source for
    `sudo apt/aptitude install programName`. These are found in sources
    list.

Launchpad
:   Launchpad is PPA repos. It can be added as an apt source (editing
    the sources list). `sudo add-apt-repository ppa:repoName` creates
    the file: `/etc/apt/sources.list.d/repoName` and contains:
    `deb http://ppa.launchpad.net/programName disco main`

Own Server with Repos

:   Launchpad is a cheap host. But we might own a server. Then\...
    `sudo add-apt-repository http://packages.mate-desktop.org/repo/ubuntu`
    a line is added to `/etc/apt/sources.list` (the list of software
    sources):
    `deb http://packages.mate-desktop.org/repo/ubuntu saucy main`

    Taking a close look, PPA is added the same way, just a bit pro
    because is a trusted source.

Snap and Ubuntu Make
:   \...

Remove and Edit Sources

:   Remove using `apt remove package_name`.

    `sources.list` can be modified from terminal or from discover -\>
    sources, graphically. Deselect is equivalent to comment out, and
    they can also be removed.

------------------------------------------------------------------------

Source
<https://askubuntu.com/questions/343333/whats-the-difference-between-a-ppa-and-a-repository>
