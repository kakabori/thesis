all: bibtex pdflatex

bibtex: thesis.tex thesis.bib
	pdflatex thesis
	bibtex thesis
	#makeglossaries thesis
	
pdflatex: bibtex
	pdflatex thesis
	pdflatex thesis
	
clean:
	rm -f thesis.bbl
