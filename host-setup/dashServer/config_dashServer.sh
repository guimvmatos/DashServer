#!/bin/bash

sudo apt-get update

apt install scapy net-tools

sudo ip link set dev lo up
sudo ip -6 addr add fc00::8/64 dev enp0s8
sudo ip link set dev enp0s8 up
sudo ip -6 neigh add fc00::1 lladdr 00:15:4d:00:00:00 nud permanent dev enp0s8
sudo ip -6 neigh add fc00::2 lladdr 00:15:4d:00:00:01 nud permanent dev enp0s8
sudo ip -6 neigh add fc00::3 lladdr 00:15:4d:00:00:02 nud permanent dev enp0s8
sudo ip -6 neigh add fc00::4 lladdr 00:15:4d:00:00:03 nud permanent dev enp0s8
sudo ip -6 neigh add fc00::5 lladdr ac:1f:6b:67:06:40 nud permanent dev enp0s8
sudo ip -6 neigh add fc00::9 lladdr 00:15:4d:00:00:04 nud permanent dev enp0s8
sudo sysctl -w net.ipv6.conf.all.seg6_require_hmac=-1
sudo sysctl -w net.ipv6.conf.all.accept_source_route=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
sudo sysctl -w net.ipv6.conf.enp0s8.seg6_require_hmac=-1
sudo sysctl -w net.ipv6.conf.enp0s8.seg6_enabled=1
sudo sysctl -p 