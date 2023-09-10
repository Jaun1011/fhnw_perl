package Arguments;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;



sub load(){

	my $arguments = {};

	for (my $i = 0; $i < @ARGV; $i += 2) {
		my $key	  = $ARGV[$i];
		my $value = $ARGV[$i + 1];

 		$key 	  =~ s/-{1,2}//;
		$arguments->{$key} = $value;
	}

	return $arguments;
}

1;

=head1 Arugments Documentation
used in part1, part2, and 