#!/bin/sh
set -eu

sysctl -w net.ipv6.conf.all.disable_ipv6=0
sysctl -w net.ipv6.conf.default.disable_ipv6=0

ip link set lo up
ip link set eth0 up

ip -6 addr replace 2001:db8:10:3::2/64 dev eth0
ip -6 route replace default via 2001:db8:10:3::1 dev eth0
