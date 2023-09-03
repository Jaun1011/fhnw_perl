use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Converter;
use File;


my $seed = File::extract_seed("./res/test/12345_9999_jku");
is $seed, 9999;

done_testing();
