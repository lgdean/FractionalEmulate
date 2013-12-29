DVIPDF_EXISTS := $(shell which dvipdf 2>/dev/null)
PDFLATEX_EXISTS := $(shell which pdflatex 2>/dev/null)
ifdef PDFLATEX_EXISTS
	PDF_DEP := %.tex
	PDF_PROG := pdflatex
else
ifdef DVIPDF_EXISTS
	PDF_DEP := %.dvi
	PDF_PROG := dvipdf
endif
endif


clean:
	rm -f fractional-emulate.dvi fractional-emulate.ps fractional-emulate.pdf *.aux *.log

dvi: fractional-emulate.dvi

ps: fractional-emulate.ps

pdf: fractional-emulate.pdf

%.dvi: %.tex
	latex $<

%.ps: %.dvi
	dvips $<

%.pdf: $(PDF_DEP)
	@echo $(PDF_DEP)
	$(PDF_PROG) $<
