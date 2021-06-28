# osi and tcp-ip models

When you walk-in to a situation, you have no idea where the problem is.  These Models give us a framework to troubleshoot the problem.

The models split a network in a number of pieces.

## tcp-ip model
There is also open systems interconnection OSI model. TPC/IP is better model.

tcp-ip is divided in 4 layers.

1.  Application: 7,6,5. Protocols: http, sftp, smb, dns, imap, dhcp,
    ftp, pop, telnet. Firefox, or Chrome, Outlook etc. make use of
    protocols on this layer on the client end whereas Apache, Node etc
    make use on the Server end. PDU: Data.
2.  Transport: 4. Protocols: TCP, UDP. PDU: Segments.
3.  Internet: 3. Protocols: IPv4, IPv6, etc. Notice **ip** on this
    layer. PDU: Packets/Datagrams. Think of all the router configuration
    (as it appears on the web gui for the router.)
4.  Network: 2,1. Protocols: Wireless Ethernet 802.11 and Wired Ethernet
    802.3, MAC, ARP, DSL, PPP. PDU: Bits. WAP, NIC. PDU: frames.

## tcp and ip protocols

IP or Internet Protocol is a routable protocol. Which means we can have subnetworks, that can be linked using a Router. In fact, part of the IP specifically defines the network, part defines the host. IP protocol is on OS-3. IP makes sure one computer finds another and are properly linked.

When a piece of data reaches the target LAN, is has only the public IP.  The router user NAT to find the server IP. The ARP or Address Resolution Protocol is in charge of mapping the IP to a MAC address, to the data flows to the particular port of the switch corresponding to the target device.

Transfer Control Protocol. Windowing. The Window can be thought as an area, and it can be closed or open. Through the window, segments of data are sent in a particular way (theoretically they multiply on every send).
# Communication in a lan

The switch has Ethernet ports, and knows which device is connected to which port (interface). In particular, it knows the MAC address, which is an unique identifier for the Network Card or Network Adapter.

When a computer sends a message, the phenomenon involved is very complex, but it can be represented in a simple way. First, we need some piece of data: a string of text, an image, an audio file, a binary, anything. 

In the application layer is the high level protocol (say http). We will need to input address and port (or it will use the default port). It also adds a source port (TCP ephemeral port). 

The switch has a MAC table, mapping MAC addresses to Port Numbers / interfaces. When a device sends a broadcast message (first msg), the switch links its MAC address to the Port. 

When we press enter a session is started between host and server; the data might be encrypted by blocks and later on is broken into packages. Some extra information is added. The packet is capped in the Router/IP/Network layer if the IPs are known. And they are capped again in layer 2 Switch/MAC/Data Link Layer using the MAC addresses from the mentioned table. (this is the capsulation process) 

The reverse process occurs in the server.

If the MAC address is not known Address Resolution Protocol comes into play. And it's a way to find MACs from IPs. [The PC receives the net parameters (IP, broadcast add, netmask; from DHCP: a service running on the router or some switches).]

When the data starts flowing through the ports, TCP (layer 4) controls the transfer. As packets come into the server, they are de-capped (decapsulation). It corrects packages losses and remembers in case of crash.

## Communication of 2 lan or lan/wan
Role of a new device on the network: The Router.

In the capsulation process the target IP is added. And the sender IP. When it reaches the gateway (router private IP add) the sender IP is replaced by the Router's Public IP. This is called NAT or Network Address Translation. And the info travels to a new lan, MAC is replaced (and IP not so it can come back).

## Packet
 MAC(sender)-IP(sender)-Payload-IP(receiver). Then there are a couple more headers. The result is called Packet and it's what is sent over the network. 
