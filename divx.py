#!/usr/bin/python
# -*- coding: utf8 -*-

import os
import sys

class divx:
    hd720 = "1280:720"
    sd480 = "720:480"
    hd480 = "854:480"

    def converte(self, res):
        os.system("mencoder \"" + sys.argv[1] + "\" -oac mp3lame -lameopts cbr=128 -ovc " +
                  "lavc -lavcopts vcodec=msmpeg4:vbitrate=1800:aspect=16/9 -ofps 23.976 -vf scale="
                  + res + " -o \"" + sys.argv[1][:-4] + "_divx.avi\"")
    
    def __init__(self):
        print "Escolha a resolução"
        print "1 => SD480 (720x480)"
        print "2 => HD480 (854x480)"
        print "3 => HD720 (1280x720)"
        
        resolucao = raw_input("Opção: ")
        
        if (resolucao == "1"):
            self.converte(self.sd480)
        elif (resolucao == "2"):
            self.converte(self.hd480)
        elif (resolucao == "3"):
            self.converte(self.hd720)
        else:
            print "Opção inválida"                            
d = divx()
