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
# <tr><th>Printer</th><th>BLACK</th><th>YELLOW</th><th>MAGENTA</th><th>CYAN</th></tr>" > $limpo

sed -r "s/, ?|;;?/\n/g" $bruto |
sed -r "s/^.*Developer.*$//g" |
sed -r "s/^.+=.*$//g" |
sed -r "s/OK|WARNING|CRITICAL|^[0-9]+$|^ ?[0-9].*$//g" |
sed -r "s/^(.+\]?).+is at ([0-9]{1,3}?%).*$/<TR><TD>\1<\/TD><TD>\2<\/TD><\/TR>/g" |
sed -r "s/<TR>(.*Magenta.*<\/TR>)/<TR STYLE=\"background-color: MAGENTA\">\1/g" |
sed -r "s/<TR>(.*Yellow.*<\/TR>)/<TR STYLE=\"background-color: YELLOW\">\1/g" |
sed -r "s/<TR>(.*Cyan.*<\/TR>)/<TR STYLE=\"background-color: CYAN\">\1/g" |
sed -r "/^$|Waste|Transfer|Fuser/d" >> $limpo

echo "</table>" >> $limpo

cat $limpo | mutt -e "set content_type=text/html" -s "Consumíveis $1" $2

limpa


# cat brother.txt| sed "s/,|;|\|/\n/g" | sed "s/OK|WARNING|^[0-9].*$//g" | sed "s/^ //g" | sed "/^$/d"
