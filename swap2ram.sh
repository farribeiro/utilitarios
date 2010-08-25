#!/bin/sh

# Autor: Fábio Rodrigues Ribeiro

# Este script esvazia a swap para RAM util em casos de
#hibernação

export p="/dev/sda2"

sudo swapoff $p
sudo swapon $p
