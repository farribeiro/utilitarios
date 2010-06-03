#!/usr/bin/python
# -*- coding: utf8 -*-

import os
import sys

class divx:
    __res720 = "1280:720"
    __res480 = "720:480"

    def comando(self, res):
        os.system("mencoder \"" + sys.argv[1] + "\" -oac mp3lame -lameopts cbr=128 -ovc lavc -lavcopts vcodec=msmpeg4:vbitrate=1800:aspect=16/9 -ofps 23.976 -vf scale=" + res + " -o \"" + sys.argv[1] + "_divx.avi\"")
    
    def __init__(self):
        print "Escolha a resolução"
        print "1 => 480"
        print "2 => 720"
        
        fmt = raw_input("Formato:")
        
        if (fmt == "1"):
            print self.comando(self.__res480)
        elif (fmt == "2"):
            self.comando(self.__res720)
        else:
            print "Nao existe"                            
d = divx()        
