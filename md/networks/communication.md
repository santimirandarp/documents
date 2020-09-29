# Communication
This is the most complex topic. Once we know:
* The basic purpose of a network
* How to set up lan
* How to connect to wan
* The osi model
We still don't quite get the whole picture.

How does communication occur between devices on a network?

## Communication in a lan
So we layed out a network. There are wired devices connected through a switch, maybe a patch panel. Patch cables are cat5e, or even cat6. There may be a WAP wired to the switch, to provide wireless connection. All this is under the 802.3 or 802.11 protocol. The wired part is 802.3X, wireless is 802.11Y. Instead of reading the standards we can make sense through a numbering system where 10GBASE-T indicates is a meaninful name for 802.3a, and means 10Gibabit speed, Baseband cable, Unshielded Twisted Pairs.

The switch has Ethernet ports, and know which device is connected to which port. In particular, it knows the MAC address, which is an unique identifier for the Network Interface or Network Adapter.

When a computer sends a message, the phenomenon involved is very complex, but it can be represented in a simple way. First, we need some piece of data: a string of text, an image, an audio file, a binary, anything.

In the application layer (7) we choose an application to connect to a server. We will need to input an address, and maybe a port (or it will use the default port). The switch has a MAC table, mapping MAC addresses to Port Numbers. When a device sends a message for the first time, it links its MAC address to the Port. 

But wait. We're on layer 7. When we press "connect" a session is started between host and server; the data might be encrypted (layer 6) and later on is broken into packages. Some extra information is added. The packet is capped in the Router/IP/Network layer if the IPs are known. And they are capped again in layer 2 Switch/MAC/Data Link Layer using the MAC addresses from the mentioned table. (this is the capsulation process) 

In the reverse process, data is decrypted on layer 6.

If the MAC address is not known Address Resolution Protocol comes into play. And it's a way to find MACs from IPs. 

When the data starts flowing through the ports, TCP (layer 4) controls the transfer. As packets come into the server, they are de-capped (decapsulation). After some time, we transfer all the data.

## Communication of 2 lan or lan/wan
Luckily, all what is said is still valid here. The main difference is the role of a new device on the network: The Router.

In the capsulation process the target IP is added. This is the Public IP of the router from a different lan. And the sender IP. When it reaches the gateway (our router) the sender IP is replaced by the Router's Public IP. This is called NAT or Network Address Translation. And the info travels to a new lan, where a similar process happens; by Port Forwarding, the router knows to which device send the incoming packet (as there is one device connected to a port). And replaces its own IP by that one, which is then converted into a MAC address.
