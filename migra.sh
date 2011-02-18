#!/bin/bash

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
	'forca-migracao')
	    migrar
       ;;
       'help')
            echo "Este utilitário realiza facilita a migração de de dados para outra HD/PARTIÇÃO para cópia utiliza o utilitário RSYNC e clonagem o DD

Comandos aceitos:

clonar    Clonagem da partição/hd
to-ext4   Prepara a partição de destino para receber o FS ext4 e migar os dados"
         ;;     
esac
