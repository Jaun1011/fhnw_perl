use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Statistic;


is Statistic::max(()),     undef;
is Statistic::max((0,1)),  1;


done_testing();
