
use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

use Test::More;

use lib 'src';
use TextNormalizer;

is TextNormalizer::standart_normalize("TEST"),        "test";
is TextNormalizer::standart_normalize(" TEST test "), "test test";
is TextNormalizer::standart_normalize(" TEST test "), "test test";

is TextNormalizer::standart_normalize("this there an was is a "), "";
is TextNormalizer::standart_normalize("asdf this there an was is a ?"), "asdf ?";

done_testing();