use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

use Test::More;

use lib 'src';
use TextNormalizer;


is TextNormalizer::levenshtein("asdf",  "asdf"),   0;
is TextNormalizer::levenshtein("asdf",  "wsdf"),   1;
is TextNormalizer::levenshtein("asdf",  "poiu"),   4;
is TextNormalizer::levenshtein("asdf",  "poiuaa"), 6;
is TextNormalizer::levenshtein("asdfia","poiu"),   5;

is TextNormalizer::levenshtein_percentage("asdf","asdf"),   0.0;
is TextNormalizer::levenshtein_percentage("asdf","wsdf"),   0.25;
is TextNormalizer::levenshtein_percentage("asdf","poiu"),   1;
is TextNormalizer::levenshtein_percentage("asdf","poiuaa"), 1.5;

done_testing();