all: dvi dvi clean

final: pdf pdf clean

dvi: 
	latex livro.tex

see:
	evince livro.dvi

pdf:
	pdflatex livro.tex

clean: clean_log clean_toc

clean_log:
	rm -rf *.aux *.log 
	
clean_toc: 
	rm -rf *.toc

clean_all: clean clean_toc
	rm -rf *.dvi *.pdf
