all: bibtex pdflatex

bibtex: thesis.tex mybib.bib
	pdflatex thesis
	bibtex thesis
	#makeglossaries thesis
	
pdflatex: bibtex
	pdflatex thesis
	pdflatex thesis
	
clean:
	rm -f thesis.bbl
	rm -f thesis.blg
	rm -f thesis.glg
	rm -f thesis.glo
	rm -f thesis.gls
	rm -f thesis.ist
	rm -f thesis.lof
	rm -f thesis.lot
	rm -f thesis.out
	rm -f thesis.toc
	rm -f *.aux
	rm -f *.log
