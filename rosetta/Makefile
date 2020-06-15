.SUFFIXES:	.q .j .t .tex .d .pdf
.SECONDARY:
.DELETE_ON_ERROR:

LATEXOPT=-shell-escape -file-line-error
DEPS=.deps
R_earth=6378.1

.q.j:
	../bin/query.py $< > $@

.j.t:
	../bin/extract.py $< > $@

#.tex.pdf:
%.pdf: %.tex $(DEPS)/%.d
	pdflatex $(LATEXOPT) $<

$(DEPS)/%.d: %.tex
	@mkdir -p $(DEPS)
	tea="$$(sed -n -e 's/.*{\([-a-zA-Z0-9_]*\.t\).*/\1/p' $< | uniq | sed -z 's/\n/ /g')"; echo -e "$*.pdf $*.d : $$tea" > $@

EXCL=	rosetta2005_newnorcia_lags.tex

Q=	$(wildcard *.q)
L=	$(filter-out $(EXCL), $(wildcard *.tex))

D=	$(L:%.tex=$(DEPS)/%.d)
T=	$(L:.tex=.pdf)

.PHONY: all
all:	$(T)

-include $(D)

.PHONY: clean
clean:
	-rm -f *.j *.t *.dep *.dpth *.md5 *.aux* *.log

.PHONY: err
err:
	tail -n 100 $$(ls -t *.log | sed -n 2p)


.PHONY: altitude
altitude: rosetta2005_altitude.t
	@awk -F "\t" 'BEGIN { i=1; split("LOS New Norcia|Perigee|AOS New Norcia", label, "|"); } /^2005-03-04.(19:57|22:09|22:44)/ { print $$1 "\t" ($$5/1000 - $(R_earth)) "\t\t" label[i]; i += 1; }' $<
