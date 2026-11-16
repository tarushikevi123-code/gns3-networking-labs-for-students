#!/bin/sh
set -eu

sysctl -w net.ipv6.conf.all.disable_ipv6=0
sysctl -w net.ipv6.conf.default.disable_ipv6=0

ip link set lo up
ip link set eth0 up

ip -6 addr replace 2001:db8:30:1::1/64 dev eth0
ip -6 addr replace 2001:db8:ffff::1/128 dev lo

sysctl -w net.ipv6.conf.all.forwarding=1

ip -6 route replace 2001:db8:10::/48 via 2001:db8:30:1::4 dev eth0
ip -6 route replace 2001:db8:20:1::/64 via 2001:db8:30:1::4 dev eth0
