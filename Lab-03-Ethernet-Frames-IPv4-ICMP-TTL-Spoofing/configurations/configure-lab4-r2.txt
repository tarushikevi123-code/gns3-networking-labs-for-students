#!/usr/bin/env bash
set -euo pipefail
ip link set eth0 up
ip addr replace 10.33.22.110/25 dev eth0
ip link set eth1 up
ip addr replace 10.33.22.210/25 dev eth1
sysctl -w net.ipv4.ip_forward=1
ip -br -4 addr
sysctl net.ipv4.ip_forward
