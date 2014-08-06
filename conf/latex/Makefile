all: dvi 

dvi: 
	latex --output-dir /tmp livro.tex
	mv /tmp/livro.dvi .

see:
	evince livro.dvi&disown

pdf:
	pdflatex -output-directory /tmp livro.tex
	mv /tmp/livro.pdf .

clean: clean_log clean_toc

clean_log:
	rm -rf *.aux *.log 
	
clean_toc: 
	rm -rf *.toc

purge: clean clean_toc
	rm -rf *.dvi *.pdf
