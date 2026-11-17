#!/usr/bin/env bash
set -euo pipefail
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 H1|H2|H3|H4|H5|H6|H7|H8" >&2
  exit 2
fi
case "${1^^}" in
  H1) HOST_IP="10.33.22.101/25"; GATEWAY="10.33.22.110" ;;
  H2) HOST_IP="10.33.22.102/25"; GATEWAY="10.33.22.110" ;;
  H3) HOST_IP="10.33.22.103/25"; GATEWAY="10.33.22.110" ;;
  H4) HOST_IP="10.33.22.104/25"; GATEWAY="10.33.22.110" ;;
  H5) HOST_IP="10.33.22.205/25"; GATEWAY="10.33.22.210" ;;
  H6) HOST_IP="10.33.22.206/25"; GATEWAY="10.33.22.210" ;;
  H7) HOST_IP="10.33.22.207/25"; GATEWAY="10.33.22.210" ;;
  H8) HOST_IP="10.33.22.208/25"; GATEWAY="10.33.22.210" ;;
  *) echo "Unknown host: $1" >&2; exit 2 ;;
esac
ip link set eth0 up
ip addr replace "$HOST_IP" dev eth0
ip route replace default via "$GATEWAY" dev eth0
ip -br -4 addr
ip route
