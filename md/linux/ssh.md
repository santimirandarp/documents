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
