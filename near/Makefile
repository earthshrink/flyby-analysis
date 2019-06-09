.SUFFIXES:	.q .j .t .tex .pdf
.DELETE_ON_ERROR:

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


All= $(T:=.pdf)

all:	$(All)

near_ssn.pdf:	near_ssn.tex near_altair.t near_millstone.t

