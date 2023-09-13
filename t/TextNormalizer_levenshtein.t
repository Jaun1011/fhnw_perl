use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

use Test::More;

use lib 'src';
use TextNormalizer;


is TextNormalizer::_levenshtein("asdf",  "asdf"),   0;
is TextNormalizer::_levenshtein("asdf",  "wsdf"),   1;
is TextNormalizer::_levenshtein("asdf",  "poiu"),   4;
is TextNormalizer::_levenshtein("asdf",  "poiuaa"), 6;
is TextNormalizer::_levenshtein("asdfia","poiu"),   5;


is TextNormalizer::levenshtein_percentage("asdf","asdf"),   0.0;
is TextNormalizer::levenshtein_percentage("asdf","wsdf"),   0.25;
is TextNormalizer::levenshtein_percentage("asdf","poiu"),   1;
is TextNormalizer::levenshtein_percentage("asdf","poiuaa"), 1.5;
is TextNormalizer::levenshtein_percentage("was ist die lösung für den nahost konflikt?","was ist die lösung für din nahost konflikt"), 0.0444444444444444;
is TextNormalizer::levenshtein_percentage("wus ist die lisung für den nahost konflikt?","was ist die lösung für din nahost konflikt"), 0.113636363636364;




done_testing();