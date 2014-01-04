#!/bin/sh

for a in $(cat /etc/passwd | cut -d ":" -f 1); do groups $a ; done

while : ; do

op = $(
 dialog --stdout \
	--menu 'Escolha um opcao: ' \
	0 0 0 \
	1 'Adicionar usuário' \
	2 'Listar usuários '  \
	3 'Deletar usuário' \
	0 'Sair' \
)
[ $? -ne 0 ] && break

done
