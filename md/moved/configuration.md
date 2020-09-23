# Configurational aspects of networks

* IP address: identifies a device on a network.
* Subnet Mask: logical segment of a network, so, for example, they do not share resources like public folders.
* Default Gateway: Router. If a resource is not found inside the LAN, goes through the Gateway to the WAN.
* dns server: maps domain names to IPs.
* dhcp: dynamic host control protocol. This server assigns the previous network parameters to a device that connects to a network. dhcp server has to be configured.
* Static: we can set this manually, but it's prone to errors (2 devices could be the same IP).
* nat: network address translation. IP needs to be unique on a LAN, but when a message goes off the network, it keeps two pieces of data: 1. the gateway IP, 2. the computer IP.

PCs on different LANs can be the same ip. If they are same IP on the same LAN, then this will cause data losses.

## Network Parameters

* inet 192.168.1.25  IP address of a computer in a network
* broadcast 192.168.1.255 internal Router ip?
* netmask 255.255.255.0 subnet mask. 
Shows that only the last number identifies a host (device) on the network. And there are 254 IPs. This means we gave the last octet (8 bits) for hosts on the network. This number is 2^n -2 (254). One is for the broadcast, the other one I don't know. And 2^n for the number of subnetworks. Which is 2^24 here.  
* Classify subnet according to that netmask ip. A: 255.0.0.0, B:255.255.0.0, C:255.255.255.0


