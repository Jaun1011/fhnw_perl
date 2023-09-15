use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Statistic;

is Statistic::standard_deviation((10, 12, 23, 23, 16, 23, 21, 16)),     4.89897948556636;

done_testing();
