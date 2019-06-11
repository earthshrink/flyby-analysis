## Using the Web interface

No setting up should be necessary if
	using the default query script `query.pl`
which is the sample Perl script
	provided on the JPL Horizons site
		with no changes.


## Using the email interface

To use the email interface instead,
	change `query.pl` in the Makefiles to `query.sh`.

The alternative script uses
	[mutt](http://mutt.org)
	for sending,
and
	[fetchmail](http://www.fetchmail.info)
	for fetching the response,
and depends on
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

