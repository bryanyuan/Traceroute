# Traceroute

implement a traceroute tool for iOS.

A couple of modifications was directly applied to Apple's SimplePing class, the tracert logic is as follows:

1. send a group of ICMP packets(3 packets) to destination

2. the TTL was increased from 1

3. we will get response on each dropped ICMP packet, the source IP will be carried by the responsed ICMP packet

4. print each source IP, otherwise print * if we haven't receive ICMP response in 3 seconds

5. stop if we reach the destination, or if the TTL reached 30
