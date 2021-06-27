# Samba share on a LAN
A Samba file server enables file sharing across different operating systems over a network. 

## From Linux
Short explanations:
* Config File `/etc/samba/smb.conf`
* smb daemon service run by systemd: `/etc/systemd/system/smbd-santi.service`
* The cli client is `smbclient <share-ip>/<foldername> -U user`, but we can normally use a gui.
* There are many clients even for phones (for both FTP and SAMBA).

Long explanations

**Samba can't be run as non-root user** (normally):

> Samba listens to ports below 1024 (135, 445 namely), and convention requires that only root can bind ports below 1024.

1. Creating the directory to share.
`mkdir /home/<username>/sambashare/`

2. Systemd wide cf is under `/etc/samba/smbd.conf`. 
At the bottom of the file, add the following lines:
```
# use [nameOfShare] to name the samba share.
[sambashare]
    comment = Samba on Ubuntu
    path = /home/username/sambashare
    read only = no
    browsable = yes
```

Make it secure by asking for user and pwd.
`sudo smbpasswd -a username && sudo smbpasswd -e username`

* Daemon system wide config is under `/etc/systemd/...`, user config under `/home/$USER/.config/systemd/user/smbd`. But this last configuration won't work, because that is a `systemd --user` command, and SAMBA will only accept root. So the file is under `/etc/systemd/...`.

The next line updates firewall rules to allow samba traffic.
```
sudo ufw allow samba 
sudo service smbd restart
```

## Samba From Router
We can connect a USB device to a router, and this initiates a samba share on the router. From the router config we could set a password, so apart from the router pwd we need an extra pwd. 

That's the service. From the client side on computers is normally straight forward (a folder), and from phones we need to download a samba or file share client and insert the router IP (normally 192.168.1.1).

## Samba Clients from phones
Samba Phone Apps allow accessing samba shares. Its also possible to create shares from phone apps.
