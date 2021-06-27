# DHCP: Dynamic Host Configuration Protocol

DHCP is a protocol to assign and request network parameters (like IPs) to network interfaces (hosts). It's configures network interfaces automatically. The DHCP server though, has to be manually configured. 

* The server is dhcpd and isc-dhcp-server, config file under */etc/dhcp/dhcpd.conf* and */etc/default/isc-dhcp-server*. 
* The client is dhclient and the config */etc/dhcp/dhclient.conf*.

If the host/client is configured to get net parameters via DHCP, then on boot it sends a broadcast message to discover where DHCP server is and ask for details.

Whenever changes are made to the *dhcpd.conf* file, dhcpd must be restarted using `systemctl restart isc-dhcp-server`

The config on */etc/default/isc-dhcp-server* is simple, we just write which interface is running the server:

```

# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
DHCPDv4_PID=/var/run/dhcpd.pid
DHCPDv6_PID=/var/run/dhcpd6.pid

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#	Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enp2s0 wlp1s0"
INTERFACESv6="enp2s0 wlp1s0"
```

The daemon file is a bit more complex:
```
# this assigns all the network parameters to a network that we name 192.168.8.0
authoritative;

subnet 192.168.8.0 netmask 255.255.255.224 { 
  option subnet-mask 255.255.255.224;
  range 192.168.8.3 192.168.8.20;
  option domain-name-servers 192.168.8.1, 8.8.8.8;
  option routers 192.168.8.1;
  option broadcast-address 192.168.8.255;
  default-lease-time 600;
  max-lease-time 7200;
}

# a static address for a device (we need to know the mac address), useful for printers etc.
host phone {
  hardware ethernet 80:4E:70:96:2F:C4;
  fixed-address 192.168.8.5; 
}
```
See `man dhcpd`, `man dhcpd.conf`, `man isc-dhcp-server`.

Another protocol is BOOTP with similar functionality.
