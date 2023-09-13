use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

use Test::More;

use lib 'src';
use TextNormalizer;

is TextNormalizer::levenshtein("asdf","asdf"), 0;
is TextNormalizer::levenshtein("asdf","wsdf"), 1;
is TextNormalizer::levenshtein("asdf","poiu"), 4;

done_testing();