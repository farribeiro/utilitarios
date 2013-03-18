#!/bin/sh

# Autor: Fábio Rodrigues Ribeiro

# Este script esvazia a swap para RAM util em casos de
#hibernação

sudo swapoff -a
sudo swapon -a
