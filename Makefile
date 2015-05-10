
BIBTEX ?= bibtex

PAPER += paper

.PHONY: all

all: pdf html view

html:
	R -q -e "rmarkdown::render('$(PAPER).markdown', 'html_document')"
pdf:
	R -q -e "rmarkdown::render('$(PAPER).markdown', 'pdf_document')"

view: $(PAPER).pdf
	open $(PAPER).pdf

clean:
	rm -f $(PAPER).{log,out,aux,bbl,blg}

cleanall: clean
	rm -f $(PAPER).{tex,pdf,html,ps}
