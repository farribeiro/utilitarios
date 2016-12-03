#!/bin/sh
# (c) Fábio Rodrigues Ribeiro - http://farribeiro.blogspot.com

# Copying and distribution of this file, with or without modification, are permitted
# in any medium without royalty provided the copyright notice and this notice are
# preserved.  This file is offered as-is, without any warranty.

# Script feito para analizar o status de toner para a impressora XEROX WORKCENTRE, usando
# SNMP para envio via email de acordo com tarefa cron.

export limpo="/tmp/limpo.html"
export bruto="/tmp/bruto.html"

limpa(){
	rm -rf $bruto
	rm -rf $limpo
}

limpa

/usr/lib/nagios/plugins/check_snmp_printer $1 public CONSUM ALL > $bruto

echo "<table border=\"1\">" > $limpo
# <tr><th>Printer</th><th>BLACK</th><th>YELLOW</th><th>MAGENTA</th><th>CYAN</th></tr>" > $limpo

sed -r "s/Waste.*$//g" $bruto |
sed -r "s/, ?|;;?/\n/g" |
sed -r "s/OK|WARNING|CRITICAL//g" |
sed -r "s/^(.+\]?).+is at ([0-9]{1,3}?%).*$/<TR><TD>\1<\/TD><TD>\2<\/TD><\/TR>/g" |
sed -r "s/<TR>(.*Magenta.*<\/TR>)/<TR STYLE=\"background-color: MAGENTA\">\1/g" |
sed -r "s/<TR>(.*Yellow.*<\/TR>)/<TR STYLE=\"background-color: YELLOW\">\1/g" |
sed -r "s/<TR>(.*Cyan.*<\/TR>)/<TR STYLE=\"background-color: CYAN\">\1/g" |
sed -r "/^$/d" >> $limpo

echo "</table>" >> $limpo

cat $limpo #| mutt -e "set content_type=text/html" -s "Consumíveis $1" $2

limpa


# cat brother.txt| sed "s/,|;|\|/\n/g" | sed "s/OK|WARNING|^[0-9].*$//g" | sed "s/^ //g" | sed "/^$/d"
