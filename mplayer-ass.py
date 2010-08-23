#!/usr/bin/python
# -*- coding: utf-8

# Este script ativa o plugin ASS para mplayer, muito utilizado em container 
# Mastroska para legendas SRT

# A condição de que a legenda tenha o mesmo nome do avi

import os
import sys


class mplayerass:
    
    def __init__(self):
        os.system("mplayer -ass -ass-font-scale 2 " + sys.argv[1])
        
m = mplayerass()
