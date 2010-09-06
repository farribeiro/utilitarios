#!/bin/sh

# Este script faz a conversão de arquivos para XVID usando o FFMPEG, inicialmente
# utilizado para converter programas do Olhar DIGITAL

ffmpeg -i "pgm"$1"_cv_integra.flv" -r 23.975 -b 1024k -vcodec libxvid -ab 128k -ar 48000 -acodec libmp3lame od_$1.avi
