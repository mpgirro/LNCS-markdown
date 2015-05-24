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
email: optional@email.com
institute: My optional Institute
university: My optional University
keywords: "Lorem, ipsum"
abstract: "Lorem ipsum"
bibliography: references.bib
csl: lncs.csl
output:
  html_document:
#    toc: true
#    toc_depth: 2
    number_sections: true
    template: lncs-template.html
    theme: null
    highlight: kate
    css: lncs.css
    self_contained: false
    md_extensions: +footnotes
  pdf_document:
    fig_caption: yes
    keep_tex: true
    template: lncs-template.tex
    md_extensions: +footnotes
---
```

For a full list of output options, see R Markdowns [HTML document format](http://rmarkdown.rstudio.com/html_document_format.html) and [PDF document format](http://rmarkdown.rstudio.com/pdf_document_format.html).

I added `toc`, `toc_depth` and `number_sections` to the `html_document` options out of personal favour though this is not conform with the LNCS style. Feel free to remove these.


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

*Note: this are the installation instructions for OSX. For other platforms, use their package managers. The package names might differe there.*

**Fonts**:

The fonts in [fonts/](fonts/) must be installed on your system.

[Pandoc](http://pandoc.org):

```
$ brew install pandoc
```

[pandoc-citeproc](https://github.com/jgm/pandoc-citeproc):

```
$ brew install pandoc-citeproc
```

[R Markdown](http://rmarkdown.rstudio.com):

```
$ brew install R
$ R
> install.packages('rmarkdown', dependencies = TRUE)
```

### Citation

In the Markdown files front matter there has to be the attribute `bibliography: references.bib` set, where the specified `.bib` file contains the references of course.

Citing a reference from the `.bib` file in the markdown text is simply done via [R markdowns citation syntax](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html):

```
bla bla bla [@xiang2007robust; @wu2005efficiently].
```

Basically, citations go inside square brackets and are separated by semicolons. Each citation must have a key, composed of `@` + the citation identifier from the database.

### Paper name

The default paper name used is `paper.markdown`, which will produce `paper.pdf` and `paper.html`. If you want to use a different name, feel free to change the `.markdown` files name, but keep in mind to alter the `PAPER` variable in the `Makefile` if you are using the `make` build approach.

Note that there is a variable for the markdown file extension `MDEXT` as well, if you would rather use `.md` or one of the other 10 or so that are out there.
