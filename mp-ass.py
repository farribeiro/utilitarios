#!/usr/bin/python
# -*- coding: utf-8

# Autor: Fábio Rodrigues Ribeiro

# Este script ativa o plugin ASS para mplayer, muito utilizado em container 
# Mastroska para legendas SRT
# A condição de que a legenda tenha o mesmo nome do avi

# Feita alteração no nome do arquivo do script para ser menor

import os
import sys


class mplayerass:
    
    def __init__(self):
        os.system("mplayer -utf8 -ass -ass-font-scale 2 " + sys.argv[1])
        
m = mplayerass()
