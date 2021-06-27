# osi and tcp-ip models

When you walk-in to a situation, you have no idea where the problem is.
These Models give us a framework to troubleshoot the problem.

The models split a network in a number of pieces.

## Open System Interconnection

osi divides the network system in 7 layers.

7.  Application
8.  Presentation
9.  Session
10. Transport
11. Network
12. Data Link
13. Physical

Layer 7 software config like Mozilla Firefox.

Layer 6 system config like Apache.

Layer 5 Tunnel of data transference between computers. Uses cookies.

Layer 4 controls speed of data transf., windowing. Ports have to do with
the communication with layer 5-4. It\'s like where (which port) the
session logs data to.

Layer 3 Router Config.

Layer 2 Switches.

Layer 1 cables, patch panels, wap, nic etc. Unplugged cables, wrong
cables, etc.

\_Not all devices are specific of one layer.

## tcp-ip model

tcp-ip is divided in 4 layers.

4.  Application: 7,6,5. Protocols: http, sftp, smb, dns, imap, dhcp,
    ftp, pop, telnet. Firefox, or Chrome, Outlook etc. make use of
    protocols on this layer on the client end whereas Apache, Node etc
    make use on the Server end. PDU: Data.
5.  Transport: 4. Protocols: TCP, UDP. PDU: Segments.
6.  Internet: 3. Protocols: IPv4, IPv6, etc. Notice **ip** on this
    layer. PDU: Packets/Datagrams. Think of all the router configuration
    (as it appears on the web gui for the router.)
7.  Network: 2,1. Protocols: Wireless Ethernet 802.11 and Wired Ethernet
    802.3, MAC, ARP, DSL, PPP. PDU: Bits. WAP, NIC. PDU: frames.

## tcp and ip protocols

IP or Internet Protocol is a routable protocol. Which means we can have
subnetworks, that can be linked using a Router. In fact, part of the IP
specifically defines the network, part defines the host. IP protocol is
on OS-3. IP makes sure one computer finds another and are properly
linked.

When a piece of data reaches the target LAN, is has only the public IP.
The router user NAT to find the server IP. The ARP or Address Resolution
Protocol is in charge of mapping the IP to a MAC address, to the data
flows to the particular port of the switch corresponding to the target
device.

Transfer Control Protocol. Windowing. The Window can be thought as an
area, and it can be closed or open. Through the window, segments of data
are sent in a particular way (theoretically they multiply on every
send).

## Configurational aspects of networks

-   IP address: identifies a device on a network.
-   Subnet Mask: logical segment of a network, so, for example, they do
    not share resources like public folders.
-   Default Gateway: Router. If a resource is not found inside the LAN,
    goes through the Gateway to the WAN.
-   dns server: maps domain names to IPs.
-   dhcp: dynamic host control protocol. This server assigns the
    previous network parameters to a device that connects to a network.
    dhcp server has to be configured.
-   Static: we can set this manually, but it\'s prone to errors (2
    devices could be the same IP).
-   nat: network address translation. IP needs to be unique on a LAN,
    but when a message goes off the network, it keeps two pieces of
    data: 1. the gateway IP, 2. the computer IP.

PCs on different LANs can be the same ip. If they are same IP on the
same LAN, then this will cause data losses.

### Network Parameters

-   inet 192.168.1.25 IP address of a computer in a network
-   broadcast 192.168.1.255 is an internal ip but is it Router ip?
-   \[sub\]netmask 255.255.255.0

### More on Subnet Mask

255.255.255.0 helps us to read IPs addresses and understand them. Helps
us to identify the subnetwork, and the devices on it.

Devices under 192.168.1.X are on the same subnetwork. For example,
192.168.1.25 and 192.168.1.255 are on the same subnetwork. 192.168.2.X
is meaningless here (because no devices will be assigned that ip). But
were the subnet mask 255.255.X.Y then it would be meaningful.

The left side from the 0 indicates the network part of the IP, and the
right side are numbers left for devices.

Classify subnet according to that subnetmask ip. A: 255.0.0.0,
B:255.255.0.0, C:255.255.255.0
