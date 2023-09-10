package FuzzyText;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

my $PATTERN_REPLACE_TOKENS = qr(this|the|is|as|a|[^a-zA-Z0-9]); 

sub _preproces($text){

    # text to lowercase    
    $text = lc $text;

    $text =~ s/$PATTERN_REPLACE_TOKENS//g;
    return $text;
}


sub compare($t1, $t2){
    return _preproces($t1) eq _preproces($t2);
}


1;