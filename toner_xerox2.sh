#!/bin/sh

export limpo="/tmp/limpo.html"
export bruto="/tmp/bruto.html"

limpa(){
	rm -rf $bruto
	rm -rf $limpo
}

limpa

echo "<table border=\"1\">
 <tr><th>Printer</th><th>BLACK</th><th>YELLOW</th><th>MAGENTA</th><th>CYAN</th></tr>" > $limpo

for i in $(cat $HOME/.tonerrc | sed -r "s/^(.+)\t.*$/\1/g"); do
	/usr/lib/nagios/plugins/check_snmp_printer $i public CONSUM ALL > $bruto
done

cat $bruto
sed -r "s/Waste.*$//g" $bruto |
sed -r "s/^.+ ([0-9]{1,3}?%).+ ([0-9]{1,3}?%).+ ([0-9]{1,3}?%).+ ([0-9]{1,3}?%).*$/<TR><TD><\/TD><TD>\1<\/TD><TD>\2<\/TD><TD>\3<\/TD><TD>\4<\/TD><\/TR>/g" >> $limpo

echo "</table>" >> $limpo


cat $limpo #| while 	read a; do


#cat $limpo | mutt -e "set content_type=text/html" -s "Quantidade de suprimentos" $1

limpa


# cat brother.txt| sed "s/,|;|\|/\n/g" | sed "s/OK|WARNING|^[0-9].*$//g" | sed "s/^ //g" | sed "/^$/d"
