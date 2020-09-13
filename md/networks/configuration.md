# Configurational aspects of networks

* IP address: identifies a device on a network.
* Subnet Mask: logical segment of a network, so, for example, they do not share resources like public folders.
* Default Gateway: the router. If a resourse is not found inside the LAN, goes through the Gateway to the WAN.
* dns: It's a server that maps domain names, to IPs.
* dhcp: dynamic host control protocol. This server assigns the previous network parameters to a device that connects to a network. dhcp server has to be configured.
* Static: we can set this manually, but it's prone to errors (2 devices could be the same IP).
* nat: network address translation. Not every device needs a universal, unique IP. It needs to be unique on a LAN, but when a message goes off the network, it keeps two pieces of data: 1. the gateway IP, 2. the computer IP.

PCs on different LANs can be the same ip. If they are same IP on the same LAN, then this will cause data losses.

**Why binary notation?**

The reason is related to computers themselves. When we want to create a subnet, the only way to understand how to build one, is to divide the bits on one of the octets.

By looking at the IP of a computer, or a subnet, we can find out many things about the network. 

inet 192.168.1.25  IP address of a computer in a network

netmask 255.255.255.0 subnet mask. Shows that only the last number identifies a host (device) on the network. And there are 256 IP ids (254 really). This means we gave the last octet (8 bits) for hosts on the network. This number is 2^n -2 (254). And 2^n for the number of subnetworks.  Which is 2^24 here.  

We can classify the subnet according to that IP. A: 255.0.0.0, B:255.255.0.0, C:255.255.255.0
broadcast 192.168.1.255


