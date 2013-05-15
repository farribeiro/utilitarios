#!/bin/sh

export limpo="/tmp/limpo.html"
export bruto="/tmp/bruto.html"

limpa(){
	rm -rf $bruto
	rm -rf $limpo
}

limpa

for i in $(cat $HOME/.tonerrc | sed -r "s/^(.+) .*$/\1/g"); do
	#export x = "`cat $HOME/.tonerrc | sed -n "/$i/p"`"
	/usr/lib/nagios/plugins/check_snmp_printer $i public CONSUM ALL | sed -r "s/^(.*)$/$i \1/g" >> $bruto
done

#cat $HOME/.tonerrc | while read a; do
	#echo $a;
#done

echo "<table border=\"1\">
 <tr><th>PRINTER</th><th>BLACK</th><th>YELLOW</th><th>MAGENTA</th><th>CYAN</th></tr>" > $limpo

#cat $bruto
sed -r "s/Waste.*$//g" $bruto |
sed -r "s/^([1-2]?[0-9]{1,2}?\.[1-2]?[0-9]{1,2}?\.[1-2]?[0-9]{1,2}?\.[1-2]?[0-9]{1,2}?) .+ ([0-9]{1,3}?%).+ ([0-9]{1,3}?%).+ ([0-9]{1,3}?%).+ ([0-9]{1,3}?%).*$/<TR><TD>\1<\/TD><TD>\2<\/TD><TD>\3<\/TD><TD>\4<\/TD><TD>\4<\/TD><\/TR>/g" >> $limpo

echo "</table>" >> $limpo

cat $limpo | mutt -e "set content_type=text/html" -s "Suprimentos Xerox WorkCentre7232" $1 #-a "../logo.jpg"

limpa


# cat brother.txt| sed "s/,|;|\|/\n/g" | sed "s/OK|WARNING|^[0-9].*$//g" | sed "s/^ //g" | sed "/^$/d"
