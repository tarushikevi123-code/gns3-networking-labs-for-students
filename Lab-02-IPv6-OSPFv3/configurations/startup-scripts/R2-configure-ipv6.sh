#!/bin/sh
set -eu

sysctl -w net.ipv6.conf.all.disable_ipv6=0
sysctl -w net.ipv6.conf.default.disable_ipv6=0

ip link set lo up
ip link set eth0 up
ip link set eth1 up
ip link set eth2 up

ip -6 addr replace 2001:db8:10:1::2/64 dev eth0
ip -6 addr replace 2001:db8:10:2::1/64 dev eth1
ip -6 addr replace 2001:db8:20:1::2/64 dev eth2

sysctl -w net.ipv6.conf.all.forwarding=1
