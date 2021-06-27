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
