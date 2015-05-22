
BIBTEX ?= bibtex
MDEXT += markdown
PAPER += paper

.PHONY: all

all: pdf html view

html:
	R -q -e "rmarkdown::render('$(PAPER).$(MDEXT)', 'html_document')"
pdf:
	R -q -e "rmarkdown::render('$(PAPER).$(MDEXT)', 'pdf_document')"

view: $(PAPER).pdf
	open $(PAPER).pdf

clean:
	rm -f $(PAPER).{log,out,aux,bbl,blg}

cleanall: clean
	rm -f $(PAPER).{tex,pdf,html,ps}
