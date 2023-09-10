package FuzzyText;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

use Test::More;

use lib 'src';
use FuzzyText;

is FuzzyText::_preproces("a the is as   "), "";
is FuzzyText::_preproces("this is a test"), "test";

done_testing();