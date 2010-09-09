all: dvi dvi clean

final: pdf pdf clean

dvi: 
	latex livro.tex

see:
	evince livro.dvi

pdf:
	pdflatex livro.tex

clean:
	rm -rf *.aux *.log *.toc

clean_all: clean
	rm -rf *.dvi *.pdf
