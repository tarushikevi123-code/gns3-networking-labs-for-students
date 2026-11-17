#!/usr/bin/env python3
import argparse
import os
import time
from scapy.all import Ether, Raw, get_if_hwaddr, hexdump, sendp

parser = argparse.ArgumentParser(description="Send a custom Ethernet frame without an IP packet")
parser.add_argument("--iface", required=True)
parser.add_argument("--dst-mac", required=True)
parser.add_argument("--name", required=True)
args = parser.parse_args()

src_mac = get_if_hwaddr(args.iface)
label = f"CN-Lab2|{args.name}|{int(time.time())}|".encode("utf-8")
padding = os.urandom(max(0, 46 - len(label)))
payload = label + padding
frame = Ether(dst=args.dst_mac, src=src_mac, type=0x88B5) / Raw(payload)
print("Frame to send:")
frame.show2()
hexdump(frame)
sendp(frame, iface=args.iface, count=1, verbose=False)
print("sent")
