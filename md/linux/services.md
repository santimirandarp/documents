# System Daemon
Main program running in the background (pid 1). systemctl (the client) controls services.

We set up the service file `/etc/systemd/system/smbd.service` and the daemon cf `/etc/smbd.conf`. [Installed programs will place services under `/lib/systemd/system/<name>.service`]. Services do not necessarily need to be run by a root user. But services under port 1024 need root privileges. 

* Daemon system wide config is under `/etc/systemd/...`, user config under `/home/$USER/.config/systemd/user/smbd`. Last configuration won't work for default port (445), `systemd --user` can't listen on those ports.

Whenever a change is made to the config file of the service, say mongod, the service has to be restarted.

## DHCP: Dynamic Host Configuration Protocol

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

## File Transfer Protocol
Transfer files btw computers over a network.

* Clients: Filezilla (GUI), ftp (CLI). APIs see for [python](https://stackoverflow.com/questions/3936911/how-can-i-login-anonymously-with-ftp-usr-bin-ftp/20031581), nodejs, etc.

* Server: vsftpd

```
sudo apt-get install vsftpd
systemctl start vsftpd && systemctl enable vsftpd # run autom. on boot
```
The client connects from a random ephemeral source port to the FTP control port 21. We can change this port on the daemon config file.  System wide config file is `/etc/vsftpd.conf`

### Type of connection
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

## SSH

```
# useful commands
sudo apt-get install openssh-server # install
sudo service ssh status #check if it's running
sudo vim /etc/ssh/sshd_config #edit daemon config file
systemctl restart ssh #if edited we need to restart service

#for the rpi
#Port: 602322
#IP: 192.168.1.12
#User: pi
```

## Samba
A Samba file server enables file sharing across different operating systems over a network. 

* Config File `/etc/samba/smb.conf`
* smb daemon service run by systemd: `/etc/systemd/system/smbd-santi.service`
* The cli client is `smbclient <share-ip>/<foldername> -U user`, but we can normally use a gui.
* There are many clients even for phones (for both FTP and SAMBA).


1. Systemd wide cf is under `/etc/samba/smbd.conf`. 
At the bottom of the file, add the following lines:
```
# use [nameOfShare] to name the samba share (we can have many)
[sambashare]
    comment = Samba on Ubuntu
    path = /home/username/<dirToShare>
    read only = no
    browsable = yes
```

Make it secure by asking for user and pwd.
`sudo smbpasswd -a username && sudo smbpasswd -e username`

* Daemon system wide config is under `/etc/systemd/...`

The next line updates firewall rules to allow samba traffic.
```
sudo ufw allow samba 
sudo service smbd restart
```

### Samba From Router
We can connect a USB device to a router and start service. From the router config we enable it, set an extra password (apart from wifi).

From the client side on computers is normally straight forward (a folder), and from phones we need to download a samba or file share client and insert the router IP (normally 192.168.1.1). Those clients can sometimes initiate services on the phone too (create phone samba shares is useful to share files).


## DNS server

It\'s like a phone book (we know the name, get the number). DNS resolves domain names to IPs. A domain name could be *https://www.google.com*. If the domain does not exist, we get an error.

To access any device in the world wide web network, we need to be connected to the wan.

## Proxy Server

It\'s a computer that asks for a webpage for us, so our IP remains hidden. Instead of asking for an address straight to the web-server, we ask to the proxy and this (with its IP) asks for the webpage or data.

A proxy server can change your IP address, so the web server doesn't know exactly where you are in the world. It can encrypt your data, so your data is unreadable in transit. And lastly, a proxy server can block access to certain web pages, based on IP address.

The benefit is surfing the web anonymously. One problem, it doesn\'t encrypt data, so in the worse scenario user/pass could be detected by hackers.

## vpn server

Virtual Private Network It encrypts data, and keeps it private. Ex NordVPN, protonVPN, mozillaVPN, expressVPN...

# OpenSSL & OpenSSH
Generate private and public keys.

Digital signature algorithms used in SSL/TLS: **ECDSA** & **RSA**.

```alg(key, text) = ciphertext```

Use OpenSSL for:  Generate keys and parameters, Create of X.509 certificates or sign requests

Use OpenSSH: Generate keypairs, Use keys to authenticate to server

## Configs
OpenSSL: `/usr/lib/ssl/` symlink to `/etc/ssl`
OpenSSH:`/etc/ssh`, `/etc/sshd/..`(client public key should be linked inside)


## File Formats
PEM (privacy enhanced mail) is a file format for storing general cryptgraphic information, but other file formats exist. PEM can be used to store private keys, certificates, or the text of an email that you want to encrypt or sign. It's just "cryptographic stuff". 

## Differences with openssh key generation
For/From OpenSSH:

> ssh-keygen(1): write OpenSSH format private keys by default instead of using OpenSSL's PEM format. Offers better protection against offline password guessing and supports key comments in private keys. If necessary, it is possible to write old PEM-style keys by adding "-m PEM" to ssh-keygen's arguments when generating or updating a key. [2018]


## Concepts
**Block** key and message is the number of bits of the key, or the ciphertext (encrypted message).

Large message block sizes are faster, large key block sizes are more secure.

DES encripts 64 bits of plain text (64bit block size), with 54 bit key.

AES uses 128,192,256 bits keys, and encodes 128-block of text (cipher).

## Types of encryption
```
openssl enc -ciphers #or
openssl list -cipher-algorithms
```
* Symmetric Crypto: each user has single key for enc & dec. It's faster than assymetric encription. But each user would need a new key. Server and client exchange the key. The problem is how to share that key without being discovered. We can use assymetric enc for this.

The symmetric encryption method works great for fast encryption of large data.

AES, RC4, DES, 3DES, RC5, RC6, etc. DES (data encryption standard) was superseeeded by AES (advanced encryption standard), a common standard.

DES (cracked) was used on TLS1.0 and 1.1; superseeded by 3DES also deprecated in 2019. Now AES is used in wifi protected access (wpa), tls/ssl (websites), file encription, VPNs.

* Asymmetric Crypto: Common ones are RSA, diffie-hellman, ECC, etc.

Each user has 2 keys, they share the public, and keep the private. One signs with the other person public key and the other person cracks using its own the private key. Asymmetric encryption method is also known as "public key cryptography.", part of pki.

Asymmetric encryption (particularly RSA) is used in many communication protocols / transport layers: TLS/SSL, SSH, Cryptocurrencies, Email, etc.

## What do websites actually use
Hybrid encryption: Asymmetric and Symmetric. RSA for starting the comm and exchanging the Private symmetric key. This is bcz symmetric cryptography is faster.

## Example: Generating RSA private key
```
openssl genpkey -aes256 -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private-key.pem
```
* Generate private key  
* sym enc for pkey -aes256 (key from passphrase)
* Generate it using asymmetric encryption RSA
* 256 bits private key 
* Output to private-key.pem (from privacy enhanced mail)

It will ask for a passphrase (we can press enter or even remove -aes256 is we don't want it).

