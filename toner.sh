#!/bin/sh

export limpo="/tmp/limpo.html"
export bruto="/tmp/bruto.html"

limpa(){
	rm -rf $bruto
	rm -rf $limpo
}

limpa

/usr/lib/nagios/plugins/check_snmp_printer $1 public CONSUM ALL > $bruto

echo "<table border=\"1\">" > $limpo

sed "s/, \?/\n/g" $bruto | sed "s/;;\?/\n/g" | sed "s/.*Developer.*//g" | sed "s/OK//g" | sed "s/WARNING//g" | sed "s/^.*=[0-9]\+$//g" | sed "s/^[0-9]\+$//g" | sed "s/^\(.*\]\).*\([0-9]\{2\}[0-9]\?%\).*$/<TR><TD>\1<\/TD><TD>\2<\/TD><\/TR>/g" | sed "s/^\(.*\) is.*\([0-9]\{2\}[0-9]\?%\).*$/<TR><TD>\1<\/TD><TD>\2<\/TD><\/TR>/g" | sed "s/<TR>\(.*Magenta.*<\/TR>\)/<TR BGCOLOR=\"MAGENTA\">\1/g" | sed "s/<TR>\(.*Yellow.*<\/TR>\)/<TR BGCOLOR=\"YELLOW\">\1/g" >> $limpo

echo "</table>" >> $limpo 

cat $limpo | mutt -e "set content_type=text/html" -s "Consumíveis $1" $2 

limpa
