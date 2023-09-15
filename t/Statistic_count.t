use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Statistic;

my $counter  = Statistic::count_items((1,1,1,2,2,3));
my $expected = {1 => 3, 2 => 2, 3 => 1};

is_deeply $counter, $expected;

done_testing();
