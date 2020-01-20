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
	rosetta2005_goldstone	\
	rosetta2005_newnorcia	\
	rosetta2007_goldstone	\
	rosetta2007_newnorcia	\
	rosetta2009_kourou	\
	rosetta2009_maspalomas	\
	rosetta2009_newnorcia

T=	\
	rosetta2005_goldstone	\
	rosetta2005_newnorcia	\
	rosetta2007_goldstone	\
	rosetta2007_newnorcia	\
	rosetta2009_maspalomas	\
	rosetta2009_newnorcia


All= $(T:=.pdf)

all:	$(All)

rosetta2005_goldstone.pdf: rosetta2005_goldstone.tex rosetta2005_goldstone.t

rosetta2005_newnorcia.pdf: rosetta2005_newnorcia.tex rosetta2005_newnorcia.t

rosetta2007_goldstone.pdf: rosetta2007_goldstone.tex rosetta2007_goldstone.t

rosetta2007_newnorcia.pdf: rosetta2007_newnorcia.tex rosetta2007_newnorcia.t

rosetta2009_maspalomas.pdf: rosetta2009_maspalomas.tex rosetta2009_maspalomas.t

rosetta2009_newnorcia.pdf: rosetta2009_newnorcia.tex rosetta2009_newnorcia.t

clean:
	rm -f *.j *.t *.dep *.dpth *.md5 *.aux* *.log

err:
	tail -n 100 $$(ls -t *.log | sed -n 2p)
