#!/usr/bin/perl -w

use Getopt::Std;

my %opt;
&getopts("f:p:r:", \%opt);


my @hdr;
my $ilc;
my $ilci;
my $ilcv;

sub gethdr {
	while (<>) { chomp; @hdr = split /\t/; last; }

	return unless defined $opt{p};

	push @hdr, "LastChange"; $ilc = $#hdr;
	push @hdr, "LastChangeAt"; $ilci = $#hdr;
	push @hdr, "LastChangeValue"; $ilcv = $#hdr;
	push @hdr, "ThisChange";
	push @hdr, "Debug";
	}

my @val;
sub putrow ($) {
	my $l = shift;
	for (my $i = 0; $i <= $#val; $i++) {
		print "$l.$i. ". ( defined $hdr[$i] ? $hdr[$i] : "?" )." = $val[$i]\n";
		}
	for (my $i = $#val+1; $i <= $#hdr; $i++) {
		print "$l.$i. ". ( defined $hdr[$i] ? $hdr[$i] : "?" )." = (null)\n";
		}
	print '-' x 30;
	print "\n";
	}

sub report {
	while (<>) {
		next if defined $opt{r} and $. < $opt{r};

		chomp;
		@val = split /\t/;
		next if defined $opt{f} and ! defined $val[$opt{f}];

		&putrow($.);

		last if defined $opt{f} and defined $val[$opt{f}];
		last if defined $opt{r} and $. >= $opt{r};
		}
	}

sub peaks {
	my %x;
	my %y;
	my $i = 0;
	my $n;
	my $xl = 0;

	my ($xi, $yi) = split /:/, $opt{p};
	while (<>) {
		chomp;
		my @val = split /\t/;
		$x[$i] = $val[$xi];
		$y[$i] = $val[$yi];
		$xl = length($x[$i]) if $xl < length($x[$i]);
		$i++;
		}
	$n = $i-1;

	my @di;
	my $ldd = 0;
	$di[0] = 0;
	for ($i = 1; $i <= $n; $i++) {
		my $dd = $y[$i] - $y[$i-1];
		my $changed = abs($dd) > 0;
		$dd = $ldd unless $changed;
		$di[$i] = $ldd;
		$ldd = $dd if $changed;
		#print "$i. $x[$i] = $y[$i] : $di[$i]\n";
		}

	my @pi;
	for ($i = 1; $i <= $n; $i++) {
		push @pi, $i if (
			( $di[$i-1] < 0 && $di[$i] > 0 ) || 
			( $di[$i-1] > 0 && $di[$i] < 0 )
			);
		#print "$i. $x[$i] = $y[$i] : $di[$i-1],  $di[$i]\n";
		}

	my $il = int(0.5+log($n)/log(10));
	my $dfmt = "%".$il."d. %".$xl."s  %8.3g  %8.3g %8.3g\n";
	my $sfmt = "%".$il."s. %-".$xl."s  %8s  %8s %8s\n";

	printf $sfmt
		, "line"
		, $hdr[$xi]
		, "extremum"
		, "previous"
		, "change"
		;

	for ($i = 1; $i <= $#pi; $i++) {
		my $j = $pi[$i];
		printf $dfmt
			, $j
			, $x[$j]
			, $y[$j]
			, ( $y[$pi[$i-1]] )
			, ( $y[$j] - $y[$pi[$i-1]] )
			;
		}
	}

&gethdr;
&report unless defined $opt{p};
&peaks if defined $opt{p};

__END__

=pod

=head1 NAME

tsv - a reader for tab-separated-values file

=head1 SYNOPSIS

tsv [options] file

=head2 Options

=over 12

=item -f col#
print first occurrence of non-null value in column (first is 0)

=item -r row#
print field values of row (first row is 1)

=item -p xcol:ycol
print extrema in column y

=back

=head1 DESCRIPTION

Tsv helps in reading a tab-separated-values file.
It treats the first row as a header containing column names.
For each row, it reports the row number and for each column,
the column number, column name from the header row, and the column value.
After each row, it prints out a horizontal line for visual clarity.
With the I<-p> option, it instead reports just the sequence of extrema
in the numerical values of the second column number specified in the argument.

=head1 AUTHOR

V. Guruprasad

=cut
