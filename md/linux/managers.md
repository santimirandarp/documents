# Package Manager

A PM is a binary (program) for installing, upgrading, configuring, and removing computer programs for a computer's operating system in a consistent manner.

Official, Launchpad and Own repos are *program pools*. They can mostly be managed with apt, which is called *package manager*. Launchpad and Own repos must be added to sources list for updates. 

1. Apt is based in dpkg (only for local packages) 
2. Apt-get is Apt improved, useful for scripting
3. Aptitude is a text-based frontend to Apt

-   Snap, Gdebi, dpkg, apt, aptitude, are package managers.
-   npm is the PM for nodejs,   pip for python

High level package managers offer, on top of `dpkg`, to edit sources lists, upgrade and update the system, autoremove, etc etc.

If we download a *.deb* we may still use **dpkg** to install.

* Install .deb

`.deb` packages can be downloaded manually or using `wget`, for google chrome (which is different from chromium) it is:

```
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb #get the file
            sudo dpkg -i google-chrome-stable_current_amd64.deb #option 1. || -i for install
            sudo gdebi google-chrome-stable_current_amd64.deb #option 2 w gdebi PI.
            sudo apt-get -f install # Errors? use run this and re-run the dpgk command.
```    

* Install compressed files `.tar.gz` or `.tar.bz2`

Sometimes it's required to download a `.tar.gz` and manually install it. Uncompress the files with some software tool. Go to the directory take a look at **readme** or install. Classically, running

```
            ./configure
            make
            sudo make install
```
      
should do the job (tar files are different than .deb). (So make is some kind of package installer too.)

**What is sources lists?**

Links to package sources */etc/apt/sources.lists*, and that's the files the command looks for to update. 


## Sound Manager

Alsa connects the audio card and the operating system. (Network Manager connects the Network cards to the OS.) It also provides an sound controller, i.e an user interface called alsamixer, to tweak the volume. Another sound controller is pulseaudio. Pulseaudio relays on Alsa SM.

Jack is a more advanced sound controller. Where any given application makes use of sound control will be up to the application developers.  Some applications will only use ALSA, some need PulseAudio, some need JACK.

*pavucontrol* is a front end for sound controlers (a volume controller).

## Window Manager

In lubuntu, the default WM is openbox. Openbox handles:

1.  The window borders, decorations, placement
2.  what is triggered with keybindings, clicks
3.  the menu icons, text and arrangement
4.  session start

The first two can be found on the config file for openbox. You should copy the file from */etc/xdg/openbox/rc.xml* to *~/.config/openbox/rc.xml* to edit it, if not there

The third one is managed by openbox-menu, don't know where the config file is, but right clicking on it there is a \'configure panel' option.  **A good alternative could be to autostart dmenu.**

After installing a WM a new session option is available for us. 


## Network managers
There are 2 network managers installed by default in ubuntu:
- Network Manager: `/lib/systemd/system/Network-Manager.service`
- systemd-networkd: `/lib/systemd/system/systemd-networkd.service`

Clients
* systemd-networkd may be introspected and controlled at runtime
       using networkctl
* for NetworkManager is nm-cli. There is a gui also (nm-connection-editor).

### NETPLAN
It allows to configure any of those backends and network properties. For example:
```
#/etc/netplan/this.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s1:
      dhcp4: false 
      addresses:
        - 192.168.0.100/24
      gateway4: 192.168.0.1
      nameservers: 
        search: [example.com, another.com]
        addresses: [1.2.1.1, 8.8.8.8]
```
```
sudo netplan --debug generate
sudo netplan apply
```
### Network Tools
* netstat, ss: see active TCP, UDP ports

Interface config

* ifconfig `ifconfig eth0 192.168.1.5 netmask 255.255.255.0 up`
* route: for the default gateway `route add default gw 192.168.1.1`
* `ip` is more complete, but changes aren't permanent

```
ip addr show === ifconfig a # for all

ip addr show enp2s0 === ifconfig enp2s0 # Or short output:

ip link set <iface> up / ip link set <iface> down

ip route show
```
* ifup in the `/etc/network/interfaces` config file.
* netplan: permanent changes can be made using netplan. 

## Useful Links
* [Openbox Hotkeys Wiki](http://openbox.org/wiki/Help:Bindings)
