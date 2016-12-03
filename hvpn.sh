#!/bin/sh

# (c) Fábio Rodrigues Ribeiro - http://farribeiro.blogspot.com

# Copying and distribution of this file, with or without modification, are permitted
# in any medium without royalty provided the copyright notice and this notice are
# preserved.  This file is offered as-is, without any warranty.

# Este script é muito semelhante aos services dos derivados do DEBIANs. É necessário ativar
# com atencedencia o tuncfg

export hvpn_network=""
export hvpn_password=""

dorme(){
	sleep 2
}

start(){
	tuncfg
	
	hamachi start
	dorme 
	
	hamachi set-nick farribeiro_note
	dorme
	
	hamachi login
	dorme
	
	hamachi join $hvpn_network $hvpn_password
	dorme
	
	hamachi go-online $hvpn_network
}

stop(){
	hamachi go-offline $hvpn_network
	dorme
	
	hamachi leave $hvpn_network
	dorme
	
	hamachi logout
	dorme
	
	hamachi stop
}

tuncfg(){
	sudo tuncfg
}

case "$1" in
	'start')
		start
	;;
	'stop')
		stop
	;;
	'restart')
		echo "== Parando serviço =="
		stop
		echo "== Iniciando serviço =="
		dorme
		start
	;;
	'add')
		hamachi create "$2"
	;;
	'del')
		hamachi delete "$2"
	;;
esac
