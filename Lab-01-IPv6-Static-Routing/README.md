# Lab 01 – IPv6 Static Routing with GNS3

## 1. Overview

This laboratory focuses on IPv6 addressing, static routing and end-to-end connectivity using GNS3 and Linux-based network nodes.

The network consists of three routers, two end hosts and an ISP router, providing an environment to implement and troubleshoot IPv6 routing.

## 2. Objectives

- Configure IPv6 addresses and prefix lengths.
- Enable IPv6 forwarding on Linux routers.
- Configure static IPv6 routes.
- Understand IPv6 Neighbor Discovery Protocol (NDP).
- Verify connectivity between directly connected devices.
- Perform end-to-end connectivity testing.
- Identify and troubleshoot routing failures.
- Configure external IPv6 connectivity through an ISP router.

## 3. Network Topology

The laboratory consists of:

- R1 – Subnet Router
- R2 – Core Router
- R3 – Edge Router
- HOST-A – Connected to R1
- HOST-B – Connected to R2
- ISP-Router – External IPv6 network

## 4. IPv6 Addressing

The laboratory uses the documentation prefix `2001:db8::/32`.

| Device | Interface | IPv6 Address |
|---|---|---|
| HOST-A | eth0 | 2001:db8:10:3::10/64 |
| R1 | eth0 | 2001:db8:10:3::1/64 |
| R1 | eth1 | 2001:db8:10:1::1/64 |
| R2 | eth0 | 2001:db8:10:1::2/64 |
| R2 | eth1 | 2001:db8:20:1::2/64 |
| R2 | eth2 | 2001:db8:10:2::1/64 |
| R3 | eth0 | 2001:db8:20:1::1/64 |
| R3 | eth1 | 2001:db8:30:1::1/64 |
| HOST-B | eth0 | 2001:db8:10:2::10/64 |
| ISP-Router | eth0 | 2001:db8:30:1::2/64 |
| ISP-Router | lo | 2001:db8:30:ffff::1/128 |

## 5. Implementation

### 5.1 Network Topology

Designed the network topology in GNS3 using Linux-based routers and hosts.

### 5.2 IPv6 Configuration

Configured IPv6 addresses on all required interfaces and enabled IPv6 forwarding on R1, R2 and R3.

### 5.3 Neighbor Discovery

Verified directly connected neighbors using IPv6 connectivity tests and the Linux neighbor table.

### 5.4 Static Routing

Configured IPv6 static routes on the routers to provide connectivity between the internal network segments.

### 5.5 Connectivity Testing

Performed IPv6 ping and traceroute tests to verify end-to-end communication.

### 5.6 Routing Failure and Recovery

Deliberately removed a static route, observed the resulting connectivity failure and restored the route to verify network recovery.

### 5.7 External IPv6 Connectivity

Configured an external IPv6 test destination through R3 and the ISP router.

## 6. Verification Commands

The following Linux commands were used:

```bash
ip -br addr
ip -6 addr
ip -6 route
ip -6 neigh show
sysctl net.ipv6.conf.all.forwarding
ping -6 -c 3 <destination-ipv6>
traceroute -6 <destination-ipv6>
```

## 7. Tools and Technologies

- GNS3
- Linux
- IPv6
- Static Routing
- Neighbor Discovery Protocol (NDP)
- ICMPv6
- Ping and Traceroute

## 8. Project Files

- GNS3 project topology
- Router configuration commands
- IPv6 addressing documentation
- Practical testing evidence
- Screenshots and verification results

## 9. Learning Outcomes

This laboratory strengthened my practical understanding of IPv6 addressing, static routing, packet forwarding, Neighbor Discovery and network troubleshooting using Linux-based network devices.

---

**Platform:** GNS3  
**Operating System:** Linux  
**Status:** Completed
