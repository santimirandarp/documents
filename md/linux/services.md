# System Daemon
This is the main program running in the background. It **keeps track of units**: service unit (programs), socket unit (services switch) and target unit (group service units).

We set up the service unit controlling the daemon `/etc/systemd/system/smbd.service` file and the damon cf `/etc/smbd.conf`. [Installed programs will place services under `/lib/systemd/system/<name>.service`]. Services do not necessarily need to be run by a root user.

Socket services listen and only run on an incoming connection. This is useful for making sure that big daemons that take up a lot of resources are only started when needed.

Targets are used for grouping and ordering units. 

For instance, multi-user.target is what most daemons are grouped under, and it requires basic.target to be activated, which means that all services grouped under basic.target will be started before the ones in multi-user.target

Most service units listen at some particular port by default, for example: webserver (80,445), ftp (22), ssh(?), samba (445). The client connects using the router IP (internet) or PC LAN IP, and the port.

Whenever a change is made to the config file of the service, say mongod, **the service has to be restarted**.
# DHCP: Dynamic Host Configuration Protocol

DHCP is a protocol to assign and request network parameters (like IPs) to network interfaces (hosts). It's configures network interfaces automatically. The DHCP server though, has to be manually configured. 

* The server is dhcpd and isc-dhcp-server, config file under */etc/dhcp/dhcpd.conf* and */etc/default/isc-dhcp-server*. 
* The client is dhclient and the config */etc/dhcp/dhclient.conf*.

If the host/client is configured to get net parameters via DHCP, then on boot it sends a broadcast message to discover where DHCP server is and ask for details.

Whenever changes are made to the *dhcpd.conf* file, dhcpd must be restarted using `systemctl restart isc-dhcp-server`

The config on */etc/default/isc-dhcp-server* is simple, we just write which interface is running the server:

```

# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
DHCPDv4_PID=/var/run/dhcpd.pid
DHCPDv6_PID=/var/run/dhcpd6.pid

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#	Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enp2s0 wlp1s0"
INTERFACESv6="enp2s0 wlp1s0"
```

The daemon file is a bit more complex:
```
# this assigns all the network parameters to a network that we name 192.168.8.0
authoritative;

subnet 192.168.8.0 netmask 255.255.255.224 { 
  option subnet-mask 255.255.255.224;
  range 192.168.8.3 192.168.8.20;
  option domain-name-servers 192.168.8.1, 8.8.8.8;
  option routers 192.168.8.1;
  option broadcast-address 192.168.8.255;
  default-lease-time 600;
  max-lease-time 7200;
}

# a static address for a device (we need to know the mac address), useful for printers etc.
host phone {
  hardware ethernet 80:4E:70:96:2F:C4;
  fixed-address 192.168.8.5; 
}
```
See `man dhcpd`, `man dhcpd.conf`, `man isc-dhcp-server`.

Another protocol is BOOTP with similar functionality.
# File Transfer Protocol
Transfer files btw computers over a network.

* Clients: Filezilla (GUI), ftp (CLI). APIs see for [python](https://stackoverflow.com/questions/3936911/how-can-i-login-anonymously-with-ftp-usr-bin-ftp/20031581), nodejs, etc.

* Server: vsftpd


## Server daemon: vsftpd

```
sudo apt-get install vsftpd
systemctl start vsftpd && systemctl enable vsftpd # run autom. on boot
```
The client connects from a random ephemeral source port to the FTP control port 21. We can change this port on the daemon config file.  System wide config file is `/etc/vsftpd.conf`

## Type of connection
* Anonymous FTP Access 

This needs an anonymous user to be created, with no privileges, so FTP uses it for accessing.

`useradd -c " FTP User" -d /var/ftp -r -s /sbin/nologin ftp`

* Local User Access
Only users on */etc/passwd* are allowed to access the FTP server.

## TLS
Generate the self signed certificate for using TLS.

```
 # openssl req -x509 -nodes -days 365 -sha256 -newkey -keyout server.pkey -out server.cert
```
## Options
I organized the file as:
1. Security
2. Anonymous users
3. Local users
4. General config

All options to be found at: http://vsftpd.beasts.org/vsftpd_conf.html

## SFTP
We secured FTP by using TLS, FTPS. But apparently SSH-FTP is a better choice, SFTP.
# SSH: highly secure access  to a computer on a network **using a text based interface**. The server will listen at a specific TCP/IP port for specific connection requests.

All the other protocols like ftp (file transfer), http (view pages), smb (share directories) are not for using a system. SSH is.

* Enable openssh-server service (other servers: wolfssh, teleport)
* Computers need to be on a network
* Clients: ssh protocol to connect to a ssh server. SSH(cli), puTTY (windows & linux, cli), easySSH
* Remove firewall issues
* Need ip:port/host:port, user, permissions.

Server will be listening at a specific tcp/ip port, for requests and connections. To check if server is installed and running type `ssh localhost`

## Server

```
# useful commands
sudo apt-get install openssh-server # install
sudo service ssh status #check if it's running
sudo vim /etc/ssh/sshd_config #edit daemon config file
systemctl restart ssh #if edited we need to restart service
```

## Client
Port: 602322
IP: 192.168.1.12
User: pi
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
