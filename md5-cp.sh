#!/bin/sh


#cópia simples
rsync -av

#checa checksun
rsync -cavn $1 $2
