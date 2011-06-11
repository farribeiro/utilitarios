#!/bin/bash

clonar(){
	d if=$2 of=imagem_$2
}

migrar(){
	rsync -av $2 $3 
}

case "$1" in
	'clonar')
		clonar
	;;
	'to-ext4')
		mkfs.ext4 $3
		migrar
	;;
	'to-raiserFS')
		mkfs.raiserfs $3
		migrar
	;;
esac
