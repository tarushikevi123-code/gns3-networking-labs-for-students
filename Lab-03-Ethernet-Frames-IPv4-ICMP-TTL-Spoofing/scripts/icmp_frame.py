#!/usr/bin/env python3
import argparse
import os
from scapy.all import Ether, ICMP, IP, Raw, get_if_addr, get_if_hwaddr, hexdump, sendp


def parse_int(value: str) -> int:
    return int(value, 0)


parser = argparse.ArgumentParser(description="Send an ICMP Echo Request as Ethernet/IPv4/ICMP")
parser.add_argument("--iface", required=True)
parser.add_argument("--next-hop-mac", required=True)
parser.add_argument("--dst-ip", required=True)
parser.add_argument("--src-ip", default=None)
parser.add_argument("--name", required=True)
parser.add_argument("--ttl", type=int, default=64)
parser.add_argument("--icmp-id", type=parse_int, default=0x1234)
parser.add_argument("--seq", type=int, default=1)
args = parser.parse_args()

if not 1 <= args.ttl <= 255:
    parser.error("--ttl must be between 1 and 255")
if args.seq < 0:
    parser.error("--seq must be zero or greater")

src_mac = get_if_hwaddr(args.iface)
src_ip = args.src_ip or get_if_addr(args.iface)
label = f"CN-Lab2-ICMP|{args.name}|".encode("utf-8")
payload = label + os.urandom(max(0, 56 - len(label)))
packet = (
    Ether(src=src_mac, dst=args.next_hop_mac, type=0x0800)
    / IP(src=src_ip, dst=args.dst_ip, ttl=args.ttl)
    / ICMP(type=8, code=0, id=args.icmp_id, seq=args.seq)
    / Raw(payload)
)

print("Packet to send:")
packet.show2()
hexdump(packet)
sendp(packet, iface=args.iface, count=1, verbose=False)
print("sent")
