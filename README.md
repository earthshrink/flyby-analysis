# Analysis of excess lags in Earth flyby tracks

This is a collection of scripts, queries, LaTeX sources and
	selected figure PDFs from NASA and ESA papers on the `flyby anomaly`,
to demonstrate
	a pattern of excess lags in Earth flybys.
The queries are set up to obtain
	range and range rate data
		for several of the flybys.
The scripts query
	JPL's official trajectory repository 
		at [JPL Horizons](https://ssd.jpl.nasa.gov/?horizons)
	by email,
and compute
	the theorized excess range and velocity lags from the responses.
The LaTeX sources produce graphs
	overlaid on the figure PDFs
to visually demonstrate
	the correlation.
See [About](About.md) for
	the background and significance of the pattern.


## Setting up

The query scripts use 
	[mutt](http://mutt.org)
	for sending,
and
	[fetchmail](http://www.fetchmail.info)
	for fetching the response.
The lags are computed using
	[perl](https://www.perl.org).
The query scripts depend on
	two configuration files
	(replace the dummy values shown!)

 - bin/env
```bash
:
EMAIL="foo@mydomain.com"
MAILARGS="-p pop3 -u $EMAIL pop.myisp.com"
```

 - bin/offline
```bash
set realname="Your Real Name"
set from="pseudonym <foo@mydomain.com>"
set use_from=yes
set envelope_from=yes

set pop_host="pop.myisp.com"
set pop_user="foo@mydomain.com"
set pop_pass="right!"

set smtp_url="smtps://foo@mydomain.com@smtp.myisp.com"
set smtp_pass="failword"
```

