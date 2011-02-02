#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys

class ppaadd:
	def __init__(self):
		os.system("sudo apt-add-repository ppa:"+sys.argv[1])

ppa = ppaadd()
