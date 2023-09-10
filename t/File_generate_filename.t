use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use File;

my $file = File::generate_filename("./test/blub"); 
ok $file =~ qr(\./test/\d{8}-\d{6}-.*);

done_testing();
