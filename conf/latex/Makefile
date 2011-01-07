all: dvi 

dvi: 
	latex --output-dir out livro.tex
	mv out/livro.dvi .

see:
	nohup evince livro.dvi&

pdf:
	pdflatex livro.tex

clean: clean_log clean_toc

clean_log:
	rm -rf *.aux *.log 
	
clean_toc: 
	rm -rf *.toc

clean_all: clean clean_toc
	rm -rf *.dvi *.pdf
