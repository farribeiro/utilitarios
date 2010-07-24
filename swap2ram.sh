#!/bin/sh
export p="/dev/sda2"

sudo swapoff $p
sudo swapon $p
