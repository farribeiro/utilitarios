#!/bin/sh

for a in $(cat /etc/passwd | cut -d ":" -f 1); do groups $a ; done
