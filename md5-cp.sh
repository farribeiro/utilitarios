#!/bin/sh

rsync -av $1 $2   #cópia simples
rsync -cavn $1 $2 #checa checksun
