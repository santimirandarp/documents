# Package Manager

A PM is a binary (program) for installing, upgrading, configuring, and removing computer programs for a computer's operating system in a consistent manner.

Official, Launchpad and Own repos are *program pools*. They can mostly be managed with apt, which is called *package manager*. Launchpad and Own repos must be added to sources list for updates. Apt-get is a newer version, with more options and better suited for scripting. Apt is based in dpkg (but this doesn't handles remote repos etc.) which is for downloaded .deb packages. Aptitude is based on apt, and is like a frontend (text-based interface).


A PM deals with packages: data in archive files. Packages contain metadata: software's name, purpose, version number, vendor, checksum, list of dependencies necessary for the software to run properly. Upon installation, metadata is stored in a local package database.

-   Snap, Gdebi, dpkg, apt, aptitude, are examples for linux package managers.  They are **not** the same.
-   npm is the PM for nodejs. Javascript packages.
-   pip for python
-   none of them have GUIs but CLis (can be found at muon pm).

## Linux PMs

A new package manager for linux is snap (`sudo apt-get install snap`).

Debian and debian based systems (DBS) use `dpkg` as a PM (low level). It is the mother of all package managers. 

### What do high level package managers offer as different from `dpkg`?

apt executes `dpkg` but also look for dependencies and offer us to install them. It's different from gdebi, which is a package installer.
Apt offers ways to edit sources lists, upgrade and update the system, autoremove, etc etc.

## Linux Package Installers: gdebi and QApt

Both offer optional GUI besides CLI. `.deb` file must be on the computer (usually downloaded from websites). PIs add info to sources list for updates and care about dependencies (automatically installed). There is no guarantee that .deb files will be added to sources.list and updated automatically when runnning
`sudo apt-get update && sudo apt-get upgrade`. 

### Software centers for GUIs and CLIs packages.

Software centers are graphical interfaces to manage software (sources taken from sources lists). Examples are Discover/Synaptic/Ubuntu Software Center, etc. There are also graphical interfaces for CLI programs like MUON in lubuntu.

Nodejs, for example, is not in discover but in muon.

### Example using dpkg and gdebi

Install Google Chrome 

`.deb` packages can be downloaded manually or using `wget`, for google chrome (which is different from chromium) it is:

```
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb #get the file
            sudo dpkg -i google-chrome-stable_current_amd64.deb #option 1. || -i for install
            sudo gdebi google-chrome-stable_current_amd64.deb #option 2 w gdebi PI.
            sudo apt-get -f install # Errors? use run this and re-run the dpgk command.
```    
## What is sources lists?

For DBS updates sources are located in /sources.lists, and that\'s the files the command looks for to update. Might be sources from canonical, or PPAs, etc. For installing programms, those read dependencies (located in the head of the .deb package/file) and offer to install them too.




### Install compressed files `.tar.gz` or `.tar.bz2`

Sometimes it's required to download a `.tar.gz` and manually install it. Uncompress the files with some software tool. Go to the directory take a look at **readme** or install. Classically, running

```
            ./configure
            make
            sudo make install
```
      
should do the job (tar files are different than .deb). (So make is some kind of package installer too.)

------------------------------------------------------------------------

## Sound Manager

Alsa connects the audio card and the operating system. It also provides an sound controller, i.e an user interface called alsamixer, to tweak the volume. Another sound controller is pulseaudio. Pulseaudio still uses Alsa for audio card and OS communication.

Jack is a more advanced sound controller. Where any given application makes use of sound control will be up to the application developers.  Some applications will only use ALSA, some need PulseAudio, some need JACK.

pavucontrol is the front end for this sound controlers (a volume controller).

## Window Manager

In lubuntu, the default WM is openbox. Openbox handles:

1.  The window borders, decorations, placement
2.  what is triggered with keybindings, clicks
3.  the menu icons, text and arrangement
4.  session start

The first two can be found on the config file for openbox. You should copy the file from /etc/xdg/openbox/rc.xml to \~/.config/openbox/rc.xml to edit it, if that file does not already exist. The file contains a ton of options. Most interesting stuff is keybindings. Again with a myriad of options.

The third one is managed by openbox-menu, don\'t know where the config file is, but right clicking on it there is a \'configure panel\' option.  We can customize the app itself and also the applications (widgets) running on it. **A good alternative could be to autostart dmenu.**

After installing openbox, or if it comes installed, a new session option is available for us. It is a complex thing and I don\'t know more than this.


## Sources
[Openbox Hotkeys Wiki](http://openbox.org/wiki/Help:Bindings)
[dpkg, apt, aptitude](https://askubuntu.com/questions/309113/what-is-the-difference-between-dpkg-and-aptitude-apt-get)
<https://opensourceforgeeks.blogspot.com/2014/11/how-to-install-google-chrome-on-ubuntu.htmlcomment-form>
<https://askubuntu.com/questions/25961/how-do-i-install-a-tar-gz-or-tar-bz2-file>
<https://askubuntu.com/questions/309113/what-is-the-difference-between-dpkg-and-aptitude-apt-get>
<https://opensourceforgeeks.blogspot.com/2014/11/how-to-install-google-chrome-on-ubuntu.htmlcomment-form>
<https://askubuntu.com/questions/25961/how-do-i-install-a-tar-gz-or-tar-bz2-file>
[Alsa, Pulseaudio, Jack: Desktop and Applications](https://askubuntu.com/questions/426983/how-can-i-tell-if-im-using-alsa-or-pulse-audio-by-default-switching-to-i3-wm)
