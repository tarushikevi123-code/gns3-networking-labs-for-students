# Lab 02 – Dynamic IPv6 Routing with OSPFv3

## 1. Project Overview

This laboratory demonstrates the implementation of dynamic IPv6 routing using OSPFv3 in a multi-router network environment built with GNS3, Docker and Linux-based network nodes.

The network uses FRRouting (FRR) to establish OSPFv3 adjacencies, exchange IPv6 routing information and provide dynamic connectivity between multiple network segments.

The implementation also includes an edge router configured to originate an external IPv6 default route into the OSPF domain.

## 2. Project Objectives

- Configure IPv6 addressing on Linux-based routers and hosts.
- Implement dynamic IPv6 routing using OSPFv3.
- Configure OSPFv3 Area 0.
- Configure router IDs and OSPF-enabled interfaces.
- Establish and verify OSPF neighbor adjacencies.
- Advertise internal IPv6 networks through OSPFv3.
- Configure an Autonomous System Boundary Router (ASBR).
- Originate an external default route using metric type 2 (E2).
- Verify dynamic routing tables and IPv6 connectivity.
- Configure startup scripts and preserve network configurations in Docker images.
- Perform routing verification and recovery tests.

## 3. Network Architecture

The laboratory consists of six GNS3 nodes:
![OSPFv3 Network Topology]<img width="1485" height="943" alt="image" src="https://github.com/user-attachments/assets/9424e626-211b-4ac3-82ed-7880c2855683" />


### Routers

- **R1 – Subnet Router:** Connects Host-1 to the internal routing infrastructure.
- **R2 – Core Router:** Connects R1, R4 and Host-2, acting as the central routing device.
- **R4 – Edge Router / ASBR:** Connects the internal network to ISP-LAB and originates the external default route into OSPFv3.

### End Devices and External Network

- **Host-1 (H1):** Connected to R1.
- **Host-2 (H2):** Connected to R2.
- **ISP-LAB:** Simulates an external IPv6 network and provides an external loopback test destination.

OSPFv3 operates on R1, R2 and R4 within Area 0.0.0.0. Host-facing OSPF interfaces are configured as passive interfaces.

## 4. IPv6 Addressing Plan

The laboratory uses the IPv6 documentation prefix `2001:db8::/32`.

| Node | Interface | IPv6 Address / Prefix |
|---|---|---|
| R1 | eth0 | 2001:db8:10:1::1/64 |
| R1 | eth1 | 2001:db8:10:3::1/64 |
| R2 | eth0 | 2001:db8:10:1::2/64 |
| R2 | eth1 | 2001:db8:10:2::1/64 |
| R2 | eth2 | 2001:db8:20:1::2/64 |
| R4 | eth1 | 2001:db8:20:1::1/64 |
| R4 | eth0 | 2001:db8:30:1::4/64 |
| H1 | eth0 | 2001:db8:10:3::2/64 |
| H2 | eth0 | 2001:db8:10:2::10/64 |
| ISP-LAB | eth0 | 2001:db8:30:1::1/64 |
| ISP-LAB | lo | 2001:db8:ffff::1/128 |

## 5. Implementation

### 5.1 Network Topology

Designed and implemented a six-node GNS3 topology using Linux-based Docker nodes.

### 5.2 FRRouting Configuration

Installed and configured FRRouting (FRR) 10.5.1 on the routing nodes.

Enabled the OSPFv3 routing process through the FRR `ospf6d` daemon.

### 5.3 OSPFv3 Configuration

Configured OSPFv3 on R1, R2 and R4 using:

- OSPFv3 Area 0.0.0.0.
- Unique router IDs.
- OSPF-enabled transit interfaces.
- Passive host-facing interfaces.
- OSPF neighbor establishment and verification.

### 5.4 External Default Route Origination

Configured R4 as the edge router and Autonomous System Boundary Router (ASBR).

A static IPv6 default route points towards ISP-LAB:

`::/0 via 2001:db8:30:1::1`

R4 advertises the default route into OSPFv3 using:

`default-information originate metric-type 2`

This allows internal routers to learn the external default route as an OSPF external type-2 (E2) route.

ISP-LAB also contains static return routes for the internal networks, independently of OSPF.

### 5.5 Routing Verification

Verified OSPFv3 neighbor states, IPv6 routing tables and the propagation of external routes.

The captured evidence includes:

- R2 showing R1 and R4 in Full neighbor state.
- R1 showing R2 in Full neighbor state.
- The learned IPv6 default route on R1 and R2.
- External E2 route verification.
- End-to-end IPv6 connectivity tests.

### 5.6 Connectivity Testing

Performed IPv6 connectivity tests between hosts and routers.

Testing included:

- Host-to-default-gateway connectivity.
- H2-to-H1 communication.
- H1-to-ISP-LAB traceroute and MTR.
- OSPF adjacency verification after restart and recovery.

### 5.7 Docker Image and Configuration Persistence

Prepared and preserved custom Docker images containing the Linux IPv6 configuration scripts and FRRouting configurations.

The implementation includes startup scripts and saved images for all six nodes.

## 6. Verification Commands

The following commands are useful for inspecting and verifying the implementation.

### Linux IPv6 configuration

```bash
ip -br addr
ip -6 addr
ip -6 route
ip -6 neigh show
```

### FRRouting / OSPFv3

```bash
vtysh
show ipv6 ospf6 neighbor
show ipv6 route
show running-config
```

### Connectivity testing

```bash
ping -6 -c 4 <destination-ipv6>
traceroute -6 <destination-ipv6>
```

### Docker environment

```bash
docker images
docker ps -a
docker inspect <container-name>
```

## 7. Technologies and Tools

- GNS3
- Docker
- Linux / Ubuntu
- FRRouting 10.5.1
- OSPFv3
- IPv6
- Dynamic Routing
- Static IPv6 Routing
- ICMPv6
- Ping and Traceroute
- MTR
- Bash scripting

## 8. Project Files

The laboratory repository includes:

- GNS3 topology and exported project.
- FRRouting configuration files.
- Linux IPv6 startup scripts.
- Docker image build and preservation information.
- Practical verification screenshots.
- IPv6 addressing documentation.
- Evidence appendix.

## 9. Learning Outcomes

This laboratory strengthened practical understanding of dynamic IPv6 routing, OSPFv3 neighbor relationships, route propagation, external route origination and Linux-based network infrastructure.

It also provided practical experience with FRRouting, Docker environments, configuration persistence and network troubleshooting.

## 10. Project Status

**Implementation:** Completed.

**Evidence:** Practical tests, routing verification, OSPFv3 neighbor states and Docker image preservation documented.

Additional evidence can be added for packet-level OSPF analysis, measured convergence during link failures, default-route withdrawal and Host-2 external connectivity.

---

**Project Area:** Network Engineering / Routing & Switching

**Platform:** GNS3

**Routing Software:** FRRouting 10.5.1

**Protocol:** OSPFv3 / IPv6
