.SUFFIXES:	.q .j .t .tex .pdf
.DELETE_ON_ERROR:

.q.j:
	../bin/query.pl $< > $@

.j.t:
	../bin/extract.pl $< > $@

.tex.pdf:
	pdflatex $<

Q=	\
	galileo_canberra	\
	galileo_goldstone	\
	galileo_madrid

T=	\
	galileo_doppler		\
	galileo_lags


All= $(T:=.pdf)

all:	$(All)

galileo_doppler.pdf:	galileo_doppler.tex $(Q:=.t)

galileo_lags.pdf:	galileo_lags.tex $(Q:=.t)

