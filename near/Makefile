.SUFFIXES:	.q .j .t .tex .pdf
#.SECONDARY:	$(T:=.j)

.q.j:
	../bin/query.sh $< > $@

.j.t:
	../bin/extract.pl $< > $@

.tex.pdf:
	pdflatex $<

Q=	\
	near_los	\
	near_aos	\
	near_altair	\
	near_millstone	\

T=	\
	near_ssn


All=	$(Q:=.t) $(T:=.pdf)

all:	$(All)

