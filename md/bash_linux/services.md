# System Daemon
This is the main program running in the background. It **keeps track of units**: service unit (programs), socket unit (services switch) and target unit (group service units).

We set up the service unit controlling the daemon `/etc/systemd/system/smbd.service` file and the damon cf `/etc/smbd.conf`. [Installed programs will place services under `/lib/systemd/system/<name>.service`]. Services do not necessarily need to be run by a root user.

Socket services listen and only run on an incoming connection. This is useful for making sure that big daemons that take up a lot of resources are only started when needed.

Targets are used for grouping and ordering units. 

For instance, multi-user.target is what most daemons are grouped under, and it requires basic.target to be activated, which means that all services grouped under basic.target will be started before the ones in multi-user.target

Most service units listen at some particular port by default, for example: webserver (80,445), ftp (22), ssh(?), samba (445). The client connects using the router IP (internet) or PC LAN IP, and the port.

Whenever a change is made to the config file of the service, say mongod, **the service has to be restarted**.
