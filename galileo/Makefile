.SUFFIXES:	.q .j .t .tex .pdf
.DELETE_ON_ERROR:

LATEXOPT=-shell-escape -file-line-error

.q.j:
	../bin/query.py $< > $@

.j.t:
	../bin/extract.py $< > $@

.tex.pdf:
	pdflatex $(LATEXOPT) $<

Q=	\
	galileo_canberra	\
	galileo_goldstone	\
	galileo_madrid

T=	\
	galileo_doppler_velocity	\
	galileo_doppler_acceleration	\
	galileo_lags


All= $(T:=.pdf)

all:	$(All)

galileo_doppler_velocity.pdf:	galileo_doppler_velocity.tex $(Q:=.t)

galileo_doppler_acceleration.pdf:	galileo_doppler_acceleration.tex $(Q:=.t)

galileo_lags.pdf:	galileo_lags.tex $(Q:=.t)

clean:
	rm -f *.j *.t *.dep *.dpth *.md5 *.aux* *.log

err:
	tail -n 100 $$(ls -t *.log | sed -n 2p)
