#!/bin/sh

export ORIGIN=$1
export DESTINATION=$2

#cópia simples
rsync -av

#checa checksun
rsync -cavn $1 $2
