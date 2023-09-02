use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'lib';
use Multi::Analysis;


my $exp = (3,1,2,4);
my $arr =  Multi::Analysis::shuffle("1234", (4,3,2,1));
is_deeply($exp, $arr);

done_testing();