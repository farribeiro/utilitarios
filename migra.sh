#!/bin/bash
# Este script é muito semelhante aos services dos derivados do DEBIANs
# É necessário ativar com atencedencia o tuncfg


clonar(){
	d if=$2 of=imagem_$2
}

migrar(){
	rsync -Cav $2 $3 
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
