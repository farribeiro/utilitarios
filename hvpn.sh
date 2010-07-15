#!/bin/sh

export hvpn_network="a_net"
export hvpn_password="fabio12345"

dorme(){
	sleep 2
}

#network=farribeiro
#password=max3r3ta 


start(){
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
