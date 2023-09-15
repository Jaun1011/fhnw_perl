use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Statistic;

is Statistic::min(()),     undef;
is Statistic::min((0,1)),  0;


done_testing();
