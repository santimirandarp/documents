# Communication in a lan

The switch has Ethernet ports, and know which device is connected to which port (interface). In particular, it knows the MAC address, which is an unique identifier for the Network Card or Network Adapter.

When a computer sends a message, the phenomenon involved is very complex, but it can be represented in a simple way. First, we need some piece of data: a string of text, an image, an audio file, a binary, anything.

In the application layer we choose an application to connect to a server. We will need to input address and port (or it will use the default port). It also adds a source port (TCP ephemeral port). 

The switch has a MAC table, mapping MAC addresses to Port Numbers / interfaces. When a device sends a message for the first time, it links its MAC address to the Port. 

When we press enter a session is started between host and server; the data might be encrypted by blocks and later on is broken into packages. Some extra information is added. The packet is capped in the Router/IP/Network layer if the IPs are known. And they are capped again in layer 2 Switch/MAC/Data Link Layer using the MAC addresses from the mentioned table. (this is the capsulation process) 

The reverse process occurs in the server.

If the MAC address is not known Address Resolution Protocol comes into play. And it's a way to find MACs from IPs. [The PC receives the net parameters (IP, broadcast add, netmask; from DHCP: a service running on the router or switch).]

When the data starts flowing through the ports, TCP (layer 4) controls the transfer. As packets come into the server, they are de-capped (decapsulation). It corrects packages losses and remembers in case of crash.

## Communication of 2 lan or lan/wan
Role of a new device on the network: The Router.

In the capsulation process the target IP is added. And the sender IP. When it reaches the gateway (router private IP add) the sender IP is replaced by the Router's Public IP. This is called NAT or Network Address Translation. And the info travels to a new lan, MAC is replaced (and IP not so it can come back).

## Packet
 MAC(sender)-IP(sender)-Payload-IP(receiver). Then there are a couple more headers. The result is called Packet and it's what is sent over the network. 
