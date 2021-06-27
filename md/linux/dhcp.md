# DHCP: Dynamic Host Configuration Protocol
Another common protocol is BOOTP with similar functionality.

DHCP is a protocol to assign and request network parameters (like IPs) to network interfaces (hosts). It's configures network interfaces automatically. 

* The server is dhcpd+isc-dhcp-server, config file under `/etc/dhcp/dhcpd.conf` but also `/etc/default/isc-dhcp-server`. 
* The client is dhclient and the config `/etc/dhcp/dhclient.conf`.

If the host/client is configured to get net parameters via DHCP, then on boot it sends a broadcast message to discover where DHCP server is and ask for details.

Whenever changes are made to the dhcpd.conf file, dhcpd must be restarted.

See `man dhcpd` and `man dhcpd.conf`.


