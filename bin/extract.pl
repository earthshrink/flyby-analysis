#!/usr/bin/perl -w

use DateTime::Format::Strptime;

my $c = 299792458;
my $sepr = "\t";

my $strp = DateTime::Format::Strptime->new(
		pattern => "%Y-%m-%d %H:%M:%S.%3N",
		time_zone => "UTC"
		);
my $pt;
my $pv;
#my $n;

my %month; @month{qw/Jan Feb Mar Apr May Jun
                     Jul Aug Sep Oct Nov Dec/} = (1 .. 12);

print join($sepr,
	"timestamp",
	"azimuth",
	"elevation",
	"lighttime",
	"range",
	"velocity",
	"acceleration",
	"rangelag",
	"velocitylag",
	"ratedoppler",
	)."\n";

my $indata = 0;
while (<>) {
	die "Error reported at line $.: $_" if /^\s*(invalid|no\s|multiple)/i;
	last if /^\$\$EOE/;
	if (/^\$\$SOE/) {
		$indata++;
		next;
		}
	next unless $indata;

	my ($datet, $solar, $lunar, $azi, $ele, $lt, $r, $v, $rest) = split /,/;

	$lt *= 60.0;	# comes in minutes!!
	$r *= 1e3;	# km -> m
	$v *= 1e3;	# km -> m

	my ($y,$m,$dtime) = split /-/, $datet;
	$datet = sprintf("%4d-%02d-%02s", $y, $month{$m}, $dtime);

	my $t = $strp->parse_datetime($datet);
	my $dt;
	if (defined $pt) {
		$dt = $t->subtract_datetime_absolute($pt);
		$dt = $dt->seconds() + $dt->nanoseconds()*1e-9;
		}

	my $dv;
	my $a;

	my $rlag;
	my $vlag;
	if (defined $pv) {
		$dv = ($v - $pv);
		$a = $dv / $dt if defined $dt;
		$rlag = $v * $r / $c;
		$vlag = $a * $r / $c;
		}

	print join($sepr,
		$datet,
		$azi,
		$ele,
		$lt,
		$r,
		$v,
		(defined $a ? $a : ""),
		(defined $rlag ? $rlag : ""),
		(defined $vlag ? $vlag : ""),
		(defined $a ? $a/$v : ""),
		)."\n";

	#last if $n++ > 10;
	$pv = $v;
	$pt = $t;
	}

die "No data processed" unless $indata;

