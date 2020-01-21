.SUFFIXES:	.q .j .t .tex .pdf
.DELETE_ON_ERROR:

LATEXOPT=-shell-escape -file-line-error

.q.j:
	../bin/query.pl $< > $@

.j.t:
	../bin/extract.pl $< > $@

.tex.pdf:
	pdflatex $(LATEXOPT) $<


Q=	\
	near_los	\
	near_aos	\
	near_altair	\
	near_millstone	\

T=	\
	near_goldstone	\
	near_canberra	\
	near_ssn


All= $(T:=.pdf)

all:	$(All)

near_ssn.pdf:	near_ssn.tex near_altair.t near_millstone.t

near_goldstone.pdf:	near_goldstone.tex near_los.t

near_canberra.pdf:	near_canberra.tex near_aos.t

clean:
	rm -f *.j *.t *.dep *.dpth *.md5 *.aux* *.log

err:
	tail -n 100 $$(ls -t *.log | sed -n 2p)
