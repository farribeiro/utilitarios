#!/usr/bin/python
# -*- coding: utf-8

# Autor: Fábio Rodrigues Ribeiro

# Este script ativa o plugin ASS para mplayer, muito utilizado em container 
# Mastroska para legendas SRT, a condição de que a legenda tenha o mesmo nome do avi

# Feita alteração no nome do arquivo do script para ser menor

# Copying and distribution of this file, with or without modification, are permitted
# in any medium without royalty provided the copyright notice and this notice are 
# preserved.  This file is offered as-is, without any warranty.

import os
import sys


class mplayerass:
    def __init__(self):
        os.system("mplayer -utf8 -ass -ass-font-scale 2 " + sys.argv[1])
        
m = mplayerass()
