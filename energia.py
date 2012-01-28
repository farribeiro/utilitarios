#!/usr/bin/python
# -*- coding: utf-8 -*-

# Calculadora de energia
# ======================
# Esta calculadora é uma reimplementação com objetivo de
# aprimorar um script bash

# (c) Fábio Rodrigues Ribeiro - http://farribeiro.blogspot.com

# Copying and distribution of this file, with or without modification, are permitted
# in any medium without royalty provided the copyright notice and this notice are 
# preserved.  This file is offered as-is, without any warranty.

import os

class gastoenergia:
	def __init__(self):
		ptnc = raw_input("Digite a Potencia(W): ")
		KW = float(ptnc) / 1000;
	   
		preco = raw_input ("Digite o preço(KW): ")
		horas4dia = raw_input("Quantas horas por dias usa o equipamento: ")
		dias = raw_input("Quantos dias usa o equipamento: ")

		preco_final = ((KW * float(preco) * float(horas4dia)) * float(dias))

		print "\nO gasto é de R$ %.2f" % preco_final

g = gastoenergia();
