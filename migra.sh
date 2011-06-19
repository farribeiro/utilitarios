#!/bin/bash

# (c) Fábio Rodrigues Ribeiro - http://farribeiro.blogspot.com

# Copying and distribution of this file, with or without modification, are permitted
# in any medium without royalty provided the copyright notice and this notice are 
# preserved.  This file is offered as-is, without any warranty.

clonar(){
	dd if=$2 of=imagem_$2
}

migrar(){
	rsync -av $2 $3 
}

bk(){
	rsync -av --delete $2 $3
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
	'backup')
		bk
	;;
esac
