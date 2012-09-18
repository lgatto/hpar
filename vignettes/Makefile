LATEXFILES = *.aux\
        *.bbl\
        *.blg\
        *.ilg\
        *.log\
        *.nlo\
        *.nls\
        *.toc\
        *.aux\
	Rplots.pdf\
	*.dvi\
	*.map\
        *.out\
	hpar.tex

all:
	make vignettes
	make clean

setvars:
ifeq (${R_HOME},)
R_HOME=	$(shell R RHOME)
endif

vignettes: 
	"$(R_HOME)/bin/R" --vanilla -e "library(knitr); knit2pdf('hpar.Rnw');"
	bibtex hpar
	"$(R_HOME)/bin/R" CMD pdflatex hpar.tex

clean:
	rm -f $(LATEXFILES)
	rm -f *~
