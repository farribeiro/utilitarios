#!/bin/sh

# Script para liberação de acesso internet entre placa de redes via NAT.
# Sintaxe: ./netfor.sh <interface_a_liberar>

# AUTOR: Fábio Rodrigues Ribeiro

sudo sysctl -w net.ipv4.ip_forward=1 
sudo iptables -t nat -A POSTROUTING -o $1 -j MASQUERADE
