dvi: fractional-emulate.dvi

ps: fractional-emulate.ps

pdf: fractional-emulate.pdf

%.dvi: %.tex
	latex $<

%.ps: %.dvi
	dvips $<

%.pdf: %.dvi
	dvipdf $<

