package TextNormalizer;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;



sub standart_normalize($text){

    # lowercase 
    $text = lc $text;
    
    # remove stopwords
    my $keywords = join("|", (
        "this",
        "there",
        "an",
        "was",
        "is",
        "a"
    ));
    $text =~ s/\b(?:$keywords)\b//g;
    
    # in between whitespaces
    $text =~ s/\s+/ /g;

    # start and end whitespaces
    $text =~ s/(^\s*|\s*$)//g;

    return $text;
}


sub levenshtein_percentage($s1, $s2){
    my ($len1, $len2) = (length $s1, length $s2);

    my $distance = _levenshtein($s1, $s2);
    return $distance / $len1;
}


sub _levenshtein($s1, $s2) {
    my ($len1, $len2) = (length $s1, length $s2);

    my @matrix;
    $matrix[$_][0] = $_ for (0 .. $len1);
    $matrix[0][$_] = $_ for (0 .. $len2);

    for my $i (1 .. $len1) {
        for my $j (1 .. $len2) {
            my $cost = substr($s1, $i-1, 1) eq substr($s2, $j-1, 1) ? 0 : 1;
            $matrix[$i][$j] = _min(
                $matrix[$i-1][$j  ] + 1,
                $matrix[$i  ][$j-1] + 1,
                $matrix[$i-1][$j-1] + $cost,
            );
        }
    }

    return $matrix[$len1][$len2];
}

sub _min(@values) {
    my $min = $values[0];
    
    for my $value (@values) {
        $min = $value if $value < $min;
    }
    
    return $min;
}
1;