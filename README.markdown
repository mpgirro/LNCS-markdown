# LNCS Markdown

This are [TeX](lncs-template.tex) and [HTML](lncs-template.html) templates as well as a [CSS](lncs.css) to render [LNCS](https://www.springer.com/computer/lncs?SGWID=0-164-6-793341-0) styled papers to PDF and HTML written in [Markdown](http://daringfireball.net/projects/markdown/).

Currently only one author is supported. 

## Format

The papers source markdown file has to have a front-matter with this layout:

```yaml
---
title: "My Title"
subtitle: "My Subtitle"
author: Maximilian Irro
email: me@example.com
keywords: "Lorem, ipsum"

abstract: "Lorem ipsum"

output:
  html_document:
    toc: true
    toc_depth: 2
    number_sections: true
    template: lncs-template.html
    theme: null
    highlight: kate
    css: lncs.css
    self_contained: false
  pdf_document:
    keep_tex: true
    template: lncs-template.tex
---
```

For a full list of output options, see R Markdowns [HTML document format](http://rmarkdown.rstudio.com/html_document_format.html) and [PDF document format](http://rmarkdown.rstudio.com/pdf_document_format.html).


## Usage

To generate the PDF:

```
$ R -q -e "rmarkdown::render('paper.markdown', 'pdf_document')"
```

To generate the HTML:

```
$ R -q -e "rmarkdown::render('paper.markdown', 'html_document')"
```

The [Makefile](Makefile) provides the basic targets `make pdf` and `make html`.

### Dependencies

[Pandoc](http://pandoc.org):

```
$ brew install pandoc
```

[R Markdown](http://rmarkdown.rstudio.com):

```
$ brew install R 
$ R 
> install.packages("rmarkdown")
```