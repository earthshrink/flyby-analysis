.SUFFIXES:	.q .j .t
.SECONDARY:	$(T:=.j)

.q.j:
	../bin/query $< > $@

.j.t:
	../bin/extract $< > $@


T=	\
	near_los	\
	near_aos	\
	near_altair	\
	near_millstone	\


All=	$(T:=.t)

all:	$(All)

