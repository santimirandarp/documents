# File Transfer Protocol
Transfer files btw computers over a network.

* Clients: * Filezilla (GUI), ftp (CLI). APIs see for [python](https://stackoverflow.com/questions/3936911/how-can-i-login-anonymously-with-ftp-usr-bin-ftp/20031581), nodejs, etc.

* Server: vsftpd

The client connects from a random ephemeral source port to the FTP control port 21. 

## Server daemon: vsftpd

```
sudo apt-get install vsftpd
systemctl start vsftpd
systemctl enable vsftpd # run autom. on boot
```

System wide config file is `/etc/vsftpd.conf`

## Type of connection
* Anonymous FTP Access 

This needs an anonymous user to be created, with no privileges, so FTP uses it for accessing.

`useradd -c " FTP User" -d /var/ftp -r -s /sbin/nologin ftp`

* Local User Access
Only users on /etc/passwd are allowed to access the FTP server.

## TLS
Generate the certificates for using TLS.

```
 openssl genpkey -aes256 -algorithm RSA -pkeyopt keygen_bits:2048 -out FTP.key # private key (rmove -aes256 to avoid encryption).
 #create certificate request using FTP private key
 openssl req -new -key FTP.key -out ftp_cert.csr 
 # ask for certificat
 # openssl x509 -req -days 365 -in ftp_cert_req.cr -signkey FTP.key -out ftp_cert.crt
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
