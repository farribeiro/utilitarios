#!/usr/bin/python
# -*- coding: utf-8

import os
import sys


class mplayerass:
    
    def __init__(self):
        os.system("mplayer -ass -ass-font-scale 2 " + sys.argv[1])
        
m = mplayerass()