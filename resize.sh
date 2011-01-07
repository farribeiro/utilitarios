#!/bin/sh

mkdir 800x600

for i in *.JPG; do
	echo "Convertendo a imagem $i ..."
	convert -resize 800x600 $i "800x600/$i"
done
