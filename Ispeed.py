#!/usr/bin/python
# -*- coding: utf8 -*-

class Ispeed:
	__link = "ftp://ftp.slackware-brasil.com.br/slackware-12.0-iso/slackware-12.0-install-d1.iso"

	def calculate(first, second, self):
		return first / second * 60

	def __init__(self):
		print self.__link

i = Ispeed()
