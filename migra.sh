#!/bin/bash

# (c) FÃ¡bio Rodrigues Ribeiro - http://farribeiro.blogspot.com

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
	'se')
		mkfs.ext4 $3
		migrar
	;;
	'sr')
		mkfs.raiserfs $3
		migrar
	;;
	'bk')
		bk
	;;
	'dd')
		clonar
	;;
       'help')
            echo "Este utilitário facilita a migração de de dados para outra HD/PARTIÇÃO para cópia utilizando o utilitário RSYNC para e para clonagem usando DD

Sintaxe:
migra.sh [opção] <origem> <destino>

Comandos aceitos:
bk    Faz backup e apaga automaticamente arquivos que não existe mais na origem
dd    Cria e recupera imagem da partição/hd
se    Prepara a partição de destino com ext4 e migar os dados
sr    Prepara a partição de destino com raiserFS e migar os dados
help  Imprime este guia"
         ;;     
esac
