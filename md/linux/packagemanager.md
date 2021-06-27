<div>

</div>

# Package Manager

Official, Launchpad and Own repos are *program pools*. They can mostly
be managed with apt, which is called *package manager*. Launchpad and
Own repos must be added to sources list for updates.

A PM is a collection of software tools that automates the process of
installing, upgrading, configuring, and removing computer programs for a
computer\'s operating system in a consistent manner.

A PM deals with packages: data in archive files. Packages contain
metadata: software\'s name, purpose, version number, vendor, checksum,
list of dependencies necessary for the software to run properly. Upon
installation, metadata is stored in a local package database.

-   Snap, Gdebi, dpkg, apt, aptitude, are examples for linux packages.
    They are **not** the same.
-   npm is the PM for nodejs. Javascript packages.
-   pip for python
-   none of them have GUIs but CLis (can be found at muon pm).

### Linux PMs

A new package manager for linux is snap (`sudo apt-get install snap`)

Debian and debian based systems (DBS) use `dpkg` as a PM (low level). It
is the mother of all package managers. `Apt` or its \'twin\' `aptitude`
for high level. The file extension of the packages is `.deb`

#### What do high level package managers offer as different from `dpgk`?

apt executes `dpkg` but also look for dependencies and offer us to
install them. It\'s different from gdebi, which is a package installer.
Apt offers ways to edit sources lists, upgrade and update the system,
autoremove, etc etc.

### Linux Package Installers: gdebi and QApt

Both offer optional GUI besides CLI. `.deb` file must be on the computer
(usually downloaded from websites). PIs add info to sources list for
updates and care about dependencies (automatically installed). There is
no guarantee that .deb files will be added to sources.list and updated
automatically when runnning
`sudo apt-get update && sudo apt-get upgrade`. This is not the case with
launchpad, and the reason why it is usually preferred.

#### Fedora Linux Branch

rpm instead of dpkg for others non dbs. File extesion .rpm

#### From Fedora to Ubuntu

.rmp files can be converted to .deb files -and reverse- using alien
tool.

### Software centers for GUIs and CLIs packages.

Softare centers are graphical interfaces to manage software (sources
taken from sources lists). Examples are Discover/Synaptic/Ubuntu
Software Center, etc. There are also graphical interfaces for CLI
programs like MUON in lubuntu.

Nodejs, for example, is not in discover but in muon.

### What is sources lists?

For DBS updates sources are located in /sources.lists, and that\'s the
files the command looks for to update. Might be sources from canonical,
or PPAs, etc. For installing programms, those read dependencies (located
in the head of the .deb package/file) and offer to install them too.

Sources
<https://askubuntu.com/questions/309113/what-is-the-difference-between-dpkg-and-aptitude-apt-get>

### Example using dpkg and gdebi

Install Google Chrome :)

`.deb` packages can be downloaded manually or using `wget`, for google
chrome (which is different from chromium) it is:

            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb //get the file
            sudo dpkg -i google-chrome-stable_current_amd64.deb //option 1. || -i for install
            sudo gdebi google-chrome-stable_current_amd64.debc//option 2 w gdebi PI.
            sudo apt-get -f install // Errors? use run this and re-run the dpgk command.
      

------------------------------------------------------------------------

Sources
<https://opensourceforgeeks.blogspot.com/2014/11/how-to-install-google-chrome-on-ubuntu.htmlcomment-form>

### Install compressed files `.tar.gz` or `.tar.bz2`

Sometimes it\'s required to download a `.tar.gz` and manually install
it. Uncompress the files with some software tool. Go to the directory
take a look at **readme** or install. Classically, running

            ./configure
            make
            sudo make install

      

should do the job (tar files are different than .deb). (So make is some
kind of package installer too.)

------------------------------------------------------------------------

Source
<https://askubuntu.com/questions/25961/how-do-i-install-a-tar-gz-or-tar-bz2-file>

### List Of Sources

-   <https://askubuntu.com/questions/309113/what-is-the-difference-between-dpkg-and-aptitude-apt-get>
-   <https://opensourceforgeeks.blogspot.com/2014/11/how-to-install-google-chrome-on-ubuntu.htmlcomment-form>
-   <https://askubuntu.com/questions/25961/how-do-i-install-a-tar-gz-or-tar-bz2-file>
