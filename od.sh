#!/bin/sh

ffmpeg -i "pgm"$1"_cv_integra.flv" -s 640x480 -r 23.975 -b 1024k -vcodec libxvid -ab 128k -ar 48000 -acodec libmp3lame od_$1.avi
