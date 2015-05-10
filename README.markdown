# LNCS Markdown

This are [TeX](lncs-template.tex) and [HTML](lncs-template.html) templates as well as a [CSS](lncs.css) to render [LNCS](https://www.springer.com/computer/lncs?SGWID=0-164-6-793341-0) styled papers to PDF and HTML written in [Markdown](http://daringfireball.net/projects/markdown/) (using [R Markdown](http://rmarkdown.rstudio.com) which uses [pandoc](http://pandoc.org)).

Currently only one author is supported. 

## Usage

To generate the PDF:

```
R -q -e "rmarkdown::render('paper.markdown', 'pdf_document')"
```

To generate the HTML:

```
R -q -e "rmarkdown::render('paper.markdown', 'html_document')"
```

The [Makefile](Makefile) provides the basic targets `make pdf` and `make html`.