use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Statistic;

is Statistic::median((1,2,3)),   2;
is Statistic::median((1,2,2,3)), 2;

done_testing();
