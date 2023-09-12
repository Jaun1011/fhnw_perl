package FuzzyText;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

my $PATTERN_REPLACE_TOKENS = qr(this|the|is|as|a|[^a-zA-Z0-9]); 

sub preproces($text){
    $text = lc $text;
    $text =~ s/$PATTERN_REPLACE_TOKENS//g;

    return $text;
}

sub compare($t1, $t2){
    return preproces($t1) eq preproces($t2);
}
1;

=head1 FuzzyText Documentation
used in part2