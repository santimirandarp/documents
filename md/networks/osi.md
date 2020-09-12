# OSI and TCP-IP models
When you walk-in to a situation, you have no idea where the problem is. These Models give us a framework to troubleshoot the problem.

The models split a network in a number of pieces.

## OSI
Open System Interconnection model

Mnemonic: Please Do Not Throw Sausage Pizza Away.

osi divides the network system in 7 layers.

1. Physical
2. Data Link
3. Network
4. Transport
5. Session
6. Presentation
7. Application

<b>Layer 7</b> is the closest to the end user. A misconfig on the software could cause problems. 

Layer 6 is the kernel/system base.

Layer 5 when visiting a website our computer starts a session with the server. Apache or PHP config files could be wrongly set up and cause network problems.

Layer 4 decides the transport of data, windowing etc. are here. Ports have to do with the communication with layer 5-4. It's like where (which port) the session logs data to.

Layer 3 routing layer. Related to Router, IP, Default Gateways, DNS server. A wrong IP would be a Network Layer Problem. 

Layer 2 all related to Switches (Media Access Control, Address Resolution Protocol). WAP, NIC. 

<b>Layer 1 </b>physical stuff like cables, patch panels, WAP, NIC etc. Unplugged cables, wrong cables, etc. 

<em>Not all devices are specific of one layer.</em>
First and Last layers are the ones mostly related to Network Problems.

Because tcp-ip is the implemented model, PDUs (process data unit) and protocols are better mapped there. And I omit them in osi. 

## TCP-IP Model

tcp-ip is divided in 4 layers.

4. Application: 7,6,5. Protocols: HTTP, SFTP, SMB, DNS, IMAP, DHCP, FTP, POP, Telnet. Firefox, or Chrome, Outlook etc. make use of protocols on this layer on the client end. Apache, Node etc make use on the Server end. PDU: Data.
3. Transport: 4. Protocols: TCP, UDP. PDU: Segments. 
2. Internet: 3. Protocols: IPv4, IPv6, etc. Notice IP on this layer. PDU: Packets/Datagrams
1. Network: 2,1. Protocols: Ethernet 802.11 and 802.3,  MAC, ARP, DSL, PPP. PDU: Bits. WAP, NIC. PDU: frames.

PDU: Protocol Data Unit.

This model is OSI but simplified. But is the actually implemented model.

## TCP and IP protocols

IP or internet protocol is a routable protocol. Which means we can have subnetworks, that can be linked using a Router. 
IP protocol is on OS-3. IP is responsible to make sure one computer finds another and properly link two computers, 

Transfer Control Protocol is related to how fast the information in transmitted. A main concept here is Windowing. The Window can be thought as an area, and it can be closed or open. Through the window, Segments of data are sent in a particular way (theoretically they multiply on every send).

### Configurational

* IP address: identifies a device on a network.
* Subnet Mask: logical segment of a network, so, for example, they do not share resources like public folders.
* Default Gateway: the router. If a resourse is not found inside the LAN, goes through the Gateway to the WAN.
* DNS: It's a server that maps domain names, to IPs.
* DHCP: dynamic host control protocol. It's a server that automatically assigns the previous network parameters to a device that connects to a network. The previous params are set up by someone (could be us).
* Static: we can set this manually, but it's prone to errors (2 devices could be the same IP, this is not good).
* NAT: network address translation. Not every device needs a universal, unique IP. It needs to be unique on a LAN, but when a message goes off the network, it keeps two pieces of data: 1. the gateway IP, 2. the computer IP. So the data is at safe.

This about NAT is why most PCs on different LANs are normally the same IPs range (192.168....), but yet this is not a problem.

If they are same IP on the same LAN, then this will cause data losses.

(Question: can we manually set up our PC IP to match an actual DHCP and fuck someone else's life?)

**Why binary notation?**

The reason is related to computers themselves. When we want to create a subnet, the only way to understand how to build one, is to divide the bits on one of the octets.

By looking at the IP of a computer, or a subnet, we can find out many things about the network. 

inet 192.168.1.25  IP address of a computer in a network

netmask 255.255.255.0 subnet mask. Shows that only the last number identifies a host (device) on the network. And there are 256 IP ids (254 really). This means we gave the last octet (8 bits) for hosts on the network. This number is 2^n -2 (254). And 2^n for the number of subnetworks.  Which is 2^24 here.  

We can classify the subnet according to that IP. A: 255.0.0.0, B:255.255.0.0, C:255.255.255.0
broadcast 192.168.1.255

@@ Hardware

