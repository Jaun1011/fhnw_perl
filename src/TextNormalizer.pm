package TextNormalizer;

use v5.36;
use strict;
use warnings;

use Data::Show;


#######################################################
# description:
#       The text is normalized by:
#           - lowercase the chars, 
#           - removing defined keywords 
#           - remove muliple whitespaces
#
# params: 
#      $text => the text which to normalize 
# return:
#       normalized text
#######################################################
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

# calculates the levenshtein distance of two strings
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

=head1 Usage
used in part 2


=head1 Description
Provides subroutines for calculating the levenshtein distance by percentage and nomalizing text.
The Levenshtein distance is performance intensive

=head2 Approximation Levenshtein

The Levenshtein distance between two strings of length n can be approximated to within a factor

    ( log ⁡ n ) O ( 1 / ε ) , {\displaystyle (\log n)^{O(1/\varepsilon )},}

where ε > 0 is a free parameter to be tuned, in time O(n1 + ε).

see (https://en.wikipedia.org/wiki/Levenshtein_distance)