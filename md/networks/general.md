# Networks

When needing to **share** resources between computers, think of networks.

> A network is nothing more than two or more computers connected by a cable or by a wireless radio connection so that they can exchange information.
>
> Networking All-in-One For Dummies

Or from [Ubuntu](https://ubuntu.com/server/docs/network-introduction)

> Networks consist of two or more devices, such as computer systems, printers, and related equipment which are connected by either physical cabling or wireless links for the purpose of sharing and distributing information among the connected devices.

Sidenote: Using cd, dvd, usb, is called *sneakernet*. In some sense, this is a network. A human carries the cd from one computer to another. This process is slow, but sometimes useful. Here we talk about wireless or wired networks.

Two computers on a network can exchange data. Let's now see how to set up a simple network.

As said, on a network computers can **share** resources like files, folders, music, films, books, almost anything. Even the data of a flash drive (usb) or a hard drive connected to a laptop. Even internet connection can be shared.

## Idea:Tables

A useful idea on networking is thinking about tables. ARP translates
(creates an equivalence table) IPs to MACs and the opposite, DNS tdomain
names to IPs.

## lan

Buzzwords for Ethernet-cables are Cat5e, Cat6, Fiber; for protocols 802.3an, 802.3i. They have friendly names: 10GBASE-T corresponds to 802.3an (suppose it): 10Gbit, type of cable (baseband), T (utp). Baseband (digital) indicates it is not a Broadband (analog) cable. utp is unshielded twisted pairs.

The protocols (802.3, 802.11) describe every single detail. Depending on the protocol used, is the cables we can choose (there is backward compatibility.)

## Hardware

1.  Modem. Converts the signal-type coming from ISPs to computer friendly signal. ISPs deliver data using Broadband Technologies: DSL, Satellite, Cable, Fiber, P2P, Wireless.
2.  Router. Connects 2 different networks, it uses the IP protocol for this.
3.  Firewall. Allows or Rejects requests and pings to particular ports and sites.
4.  Switch: connects wired devices. There are unmanaged and managed switches. The latter ones can be programmed for specific tasks. The switch supports particular speeds.
5.  Wireless Access Point or WAP (optional): connects wifi devices.  It\'s linked to the switch.
6.  Computer

This hardware is in the client side, there is different hardware for ISPs

### Modem

The modem is usually connected to a Fiber Cable or to the Phone line (dsl) or to the Cable (tv like). On the other end it connects to the Router or Switch.

The word modem comes from modulate/demodulate. It could be electric to sound (DSL) and viceversa.

### Router

The router connects 2 different networks. Normally, we connect the WAN (internet) on one port, and our devices using wireless access points or cables. But we can connect any two networks!

The way computers find each other is specified in the Internet Protocol (IP). Any connection between 2 networks needs a router. Routers have 2 IP addresses, external and internal. The router connected to the wan (there may be more than one router) is the one with the Public IP of the network, on the outside. The internal ip is called Gateway.

Routers contain other devices and services: switch, wap, nat, dns, dhcp, firewall. Routers need to be configured. For small networks this is pretty straight-forward.

### WAP

**Wireless** network devices 802.11a, 802.11b, 802.11g, 802.11n, 802.11ac. Most of them are compatible to each other (only a is useless), so most network cards should work - as long as we have the drivers installed. We should pick up the best speed match. n-type spans a wide area and is quick. Most times integrated in the Router.

### Firewall

A firewall allows us to block ports. **Host-based** firewalls are the ones set up on a computer, and protect only that computer. Windows comes with firewall and also 3rd parties can be installed. Antivirus might come with firewall. **Network-based** firewall rules are applied to the entire network. This is probably set in the switch or Router, by tweaking its config using a web-gui.

### Cabling

-   CAT5e are used for networking. Supports Gb/s speed.  -   Plugs. RJ45 (ethernet), RJ11 (phones). Don\'t confuse them.  -   Tools. Electrician Scissors, to cut the cables. Crim, to tight jack and cables in the end. Punchdown, for patch cables. Cable Tester, to check if the line is brake or we confuse cables order in the jack.  Tonning device, to find our cable among the crowd.

The proceduce consist on cutting out the shield, untwisting the cables, tight them and put inside the Jack, in consisteng order on each side.  The standard is: white orange, orange, white green, blue, white blue, green, brown white brown. We use the crim to cut evenly.

There are 2 types of Jack, Male and Female. Females are the ones where people plugs the ethernet cables. Males are the ethernet cables. There is a different color order indicated in the cable itself (dont memorize). Here we use the punchdown tool.

## Example: soho network

soho networks are small networks; like a lan at home. For this kind of networks we can buy a particular type of Routers. Enterprise routers only route traffic over/in/out the lan. Soho routers include many other devices.

We can configure a soho Router using a web browser, by typing the router\'s IP in the URL bar. This is not the way to set up an enterprise router.

When a device connects to a network, it either has a static or a dynamic IP. We want the DHCP server to assign all the network parameters automatically. For that, we configure an IP range on the DHCP server.

If there is a server on the lan, we want a static ip. Let\'s say someone in a different part of the world types our domain in a browser. They get the domain\'s IP from a DNS server. The request lands to the router at a particular port. This depends on the type of request. We need to link the IP of our lan server to the specific port. Web requests arrive at port 80, ftp at 21, etc etc. We can look them up online.

Then, in the port forward section, we write our server IP and the port it will be listening to. Example 192.168.0.1:80

If the server IP is not static, then the redirection will occur either to another device, or to nowhere, and the request will fail. So, for servers, we need a static IP.

## Protocols

The main protocols are IP and TCP. IP is in charge of the routing, TCP on sending packets in order and making sure they are received, and on setting a proper speed of transmission.

### Configuration

The TCP/IP protocol configuration consists of several elements which must be set by editing the appropriate configuration files, or deploying solutions such as the Dynamic Host Configuration Protocol (DHCP) server which in turn, can be configured to provide the proper TCP/IP configuration settings to network clients automatically.

Main configuration elements are:

* IP address

* Netmask or SubnetMask: Useful for internal communication. Separates the portions of an IP address significant to the network from the bits significant to the subnetwork. For class C is 255.255.255.0. We would specify: netmask, range of IPs, etc on DHCP. Then we can \*\* create subnets with same netmask different second \*byte\*: 192.168.2.0 \*\*.

* Network address: for class C is 192.168.1.0, using the last byte for devices. For class A using last 3 bytes.

* Broadcast address: 192.168.1.255, used by ARP and RIP. Sends a message to all hosts.

* Gateway: Router IP, useful for external comm (send data out of network). It passes data to ISP or other router.

* Nameserver Addresses are names for the IP, that the DNS will resolve.

All this is specified under `/etc/network/interfaces` or `/etc/netplan/*.yml`. 
