# GNS3 Networking Laboratories

## Project Overview

This repository contains practical networking laboratories implemented using GNS3, Linux-based network nodes and Docker environments.

The laboratories focus on routing protocols, IPv6 networking, Ethernet frame analysis, network troubleshooting and packet inspection.

Each laboratory includes its own network topology, configurations, practical implementation, testing procedures and technical documentation.

## Completed Laboratories

### Lab 01 – IPv6 Static Routing

**Platform:** GNS3, Linux

- IPv6 addressing and interface configuration.
- IPv6 forwarding on Linux routers.
- Static IPv6 route configuration.
- Neighbor Discovery Protocol (NDP).
- End-to-end connectivity testing.
- Route failure simulation and troubleshooting.
- External IPv6 connectivity through an ISP router.

### Lab 02 – Dynamic IPv6 Routing with OSPFv3

**Platform:** GNS3, Docker, Linux, FRRouting (FRR)

- OSPFv3 configuration and implementation.
- IPv6 dynamic routing using Area 0.
- Router IDs and passive interfaces.
- OSPF neighbor and routing table verification.
- Link-state database analysis.
- Default route origination and withdrawal.
- Routing failure experiments and troubleshooting.

### Lab 03 – Ethernet Frames, IPv4, ICMP, TTL and Spoofing

**Platform:** GNS3, Linux, Python, Scapy, Wireshark

- Ethernet II frame structure and analysis.
- Layer 2 MAC addressing and Layer 3 IPv4 addressing.
- Custom Ethernet frame generation using Scapy.
- Ethernet/IP/ICMP encapsulation.
- ICMP Echo Request and Reply analysis.
- TTL behaviour during packet forwarding.
- Controlled source-IP spoofing in an isolated laboratory network.
- Packet inspection using Wireshark and tcpdump.

## Technologies and Tools

- GNS3
- Docker
- Linux (Ubuntu / Debian)
- IPv4 and IPv6
- Static Routing
- OSPFv3
- FRRouting (FRR)
- Python
- Scapy
- Wireshark
- tcpdump

## Repository Structure

Each laboratory has a separate directory containing its topology files, configurations, scripts, screenshots and documentation.

## Project Status

**3 completed laboratories.**

Additional networking laboratories are being developed and will be added to this repository.

---

**Project Area:** Network Engineering / Routing & Switching / Network Analysis

**Platform:** GNS3
