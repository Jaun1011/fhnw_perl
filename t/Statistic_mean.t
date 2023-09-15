use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Statistic;

is Statistic::mean(()),     undef;
is Statistic::mean((0,1)),  0.5;
is Statistic::mean((0)),    0;

done_testing();
