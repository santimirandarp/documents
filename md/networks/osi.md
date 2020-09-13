# osi and tcp-ip models
When you walk-in to a situation, you have no idea where the problem is. These Models give us a framework to troubleshoot the problem.

The models split a network in a number of pieces.

## Open System Interconnection

osi divides the network system in 7 layers.

1. Physical
2. Data Link
3. Network
4. Transport
5. Session
6. Presentation
7. Application

Mnemonic: Please Do Not Throw Sausage Pizza Away.

**Layer 7** is the closest to the end user. A misconfig on the software could cause problems. 

Layer 6 is the kernel/system base.

Layer 5 when visiting a website our computer starts a session with the server. Apache or PHP config files could be wrongly set up and cause network problems.

Layer 4 decides the transport of data, windowing etc. Ports have to do with the communication with layer 5-4. It's like where (which port) the session logs data to.

Layer 3 routing layer. Router, IP, Default Gateways, DNS server. A wrong IP would be a Network Layer Problem. 

Layer 2 Switches (Media Access Control, Address Resolution Protocol). wap, nic.

**Layer 1** physical stuff like cables, patch panels, wap, nic etc. Unplugged cables, wrong cables, etc. 

_Not all devices are specific of one layer._ First and Last layers are problematic.

tcp-ip is the implemented model, so PDUs (protocol data unit) and protocols are better mapped there. I omit them in osi. 

## tcp-ip model

tcp-ip is divided in 4 layers.

4. Application: 7,6,5. Protocols: http, sftp, smb, dns, imap, dhcp, ftp, pop, telnet. Firefox, or Chrome, Outlook etc. make use of protocols on this layer on the client end whereas Apache, Node etc make use on the Server end. PDU: Data.
3. Transport: 4. Protocols: TCP, UDP. PDU: Segments. 
2. Internet: 3. Protocols: IPv4, IPv6, etc. Notice **ip** on this layer. PDU: Packets/Datagrams. Think of all the router configuration (as it appears on the web gui for the router.)
1. Network: 2,1. Protocols: Ethernet 802.11 and 802.3,  MAC, ARP, DSL, PPP. PDU: Bits. WAP, NIC. PDU: frames.

This model is osi but simplified. But is the actually implemented model.

## tcp and ip protocols

IP or Internet Protocol is a routable protocol. Which means we can have subnetworks, that can be linked using a Router. 
IP protocol is on OS-3. IP makes sure one computer finds another and are properly linked, 

   Transfer Control Protocol. A main concept here is Windowing. The Window can be thought as an area, and it can be closed or open. Through the window, Segments of data are sent in a particular way (theoretically they multiply on every send).

