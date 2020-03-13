.SUFFIXES:	.q .j .t .tex .d .pdf
.SECONDARY:
.DELETE_ON_ERROR:

LATEXOPT=-shell-escape -file-line-error
DEPS=.deps

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

