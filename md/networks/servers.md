# Servers

1.  Servers are computers offering services to other computers
    (clients). They must be on a network.
2.  There are specific computers used as servers, but our own computer
    can be converted into a server.
3.  Depending on the client-server communication protocol, is the
    software we install on each end.

## Type of servers

-   File (ftp, sftp)
-   Authentication
-   Web (http, https)
-   ssh, scp
-   smb, sync, library, rtc: share (lan, wan) and edit files/folders.
    Shared folder for a network. Different protocol than ftp.
-   Mail (pop3, smtp, imap)
-   dns, dhcp, Firewall, Port Forward.
-   Proxy
-   VPN
-   Database
-   BitTorrent

One computer can be multiple servers, it\'s not just one server on each
computer.

## Software

A browser is just a popular http client; filezilla an ftp one. There are
other tools using same protocols for communication between devices. Some
of those tools are text-based or command line browsers, the http
cli-program in linux.

There is also related software to download webpages, for example wget or
curl.

On the server side, apache is a popular http server, samba an smb
server, etc.

## Hardware

Servers use Xeon processors, redundant power supplies (RSP) so if one
dies the system keeps running (ideally it runs 24/7). We can take out
and replace it. Redundant array of inexpensive disks (RAID). The
computer maintains more than one copy of the data, using many hard
drives, if one cracks down, we can replace it, and everything is
rebuild. Error-code Correction (ECC) RAM runs a check of the RAM.

## DNS server

It\'s like a phone book (we know the name, get the number). DNS resolves
domain names to IPs. A domain name could be *https://www.google.com*. If
the domain does not exist, we get an error.

To access any device in the world wide web network, we need to be
connected to the wan.

## Proxy Server

It\'s a computer that asks for a webpage for us, so our IP remains
hidden. Instead of asking for an address straight to the web-server, we
ask to the proxy and this (with its IP) asks for the webpage or data.

A proxy server can change your IP address, so the web server doesn't
know exactly where you are in the world. It can encrypt your data, so
your data is unreadable in transit. And lastly, a proxy server can block
access to certain web pages, based on IP address.

The benefit is surfing the web anonymously. One problem, it doesn\'t
encrypt data, so in the worse scenario user/pass could be detected by
hackers.

## vpn server

Virtual Private Network It encrypts data, and keeps it private. Ex
NordVPN

## ftp server

-   Use port 21 to be secured?
-   exchange files with ftp-server. \`ftp\` on command line or gui
    clients.
-   Apart from port 21, it\'s not a secure way to transfer files.

Example
:   On a browser\'s address bar: ftp://address
:   cli: ftp adress
:   Filezilla: write adress in search box.

Without a secure connection hackers see anything transferred over the
network. This is not a secure method to buy things, log into social
networks etc. But can do simple stuff.

For sensible data SFTP should be used instead. SFTP uses secure shell,
encrypts the data. Port 22.

In any case, we need the IP, a user and a password.

## http server

HyperText Transfer Protocol Access **public** files of a server. It\'s
possible ([C-S]{.kbd}) to download the html, not just the source code,
but all linked files even if they are in a different domain.)

-   On a Browser Address Bar: *http://www.domainName.subDomain*
-   Using wget and curl: wget/curl \[options\] webaddress; or GET, POST,
    HTTP + webadress

## BitTorrent

Bit torrent is another protocol. The network is also a server-client
architecture. But instead of being centralized network - where all data
is server by the server, each computer acts as a client and a server.

So BitTorrent is a protocol useful to set up a descentralized network.

There is no Unique Source of Power, but many. In this case, the software
we install is both client and server. It\'s not like a web where there
is an Apache Server and Firefox client. There is, for example, uTorrent,
and other software being both roles at once.

We can of course, configure the client-side and the server-side. We can
even shutdown the server.

This Descentralized architecture, where we are serving file to others,
is called Peer-To-Peer, or P2P.

[See backend](../web/backend.html) for instructions setting up http
servers.

## In a few words

So setting up a network we can share stuff between computers. Networks
are composed by a client and a server. And we can configure the server
to serve different things: websites, files, access to folders, or to
cameras, etc.

There are sometimes many types of servers useful for the same task. For
example, a web server can be used to serve files. But usually there are
specific protocols (or a few of them) good for specific tasks.

We can transfer files using HTTP, SMB, BitTorrent, SSH\...!

There are also many different clients we can install to interact with a
server.

There is a nice symmetry in all this. All clients (Firefox, utorrent)
etc. Will need a link, and sometimes a password. What is this? Well,
with some variation, is the location of a resource on the network.
