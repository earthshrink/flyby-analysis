.SUFFIXES:	.q .j .t
.SECONDARY:	$(T:=.j)

.q.j:
	../bin/query $< > $@

T=	\
	near_los	\
	near_aos	\
	near_altair	\
	near_millstone	\


All=	$(T:=.j)

all:	$(All)

