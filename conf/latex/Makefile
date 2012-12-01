all: dvi 

dvi: 
	latex --output-dir /tmp/latex livro.tex
	mv /tmp/latex/livro.dvi .

see:
	evince livro.dvi&disown

pdf:
	pdflatex livro.tex

clean: clean_log clean_toc

clean_log:
	rm -rf *.aux *.log 
	
clean_toc: 
	rm -rf *.toc

purge: clean clean_toc
	rm -rf *.dvi *.pdf
