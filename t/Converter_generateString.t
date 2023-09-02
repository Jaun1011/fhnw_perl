use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'lib';

use Multi::Converter;
use Multi::File;



my $path = "./t/res/basic_test_exam";
my $exam = do "$path.pl";

my $expected = Multi::File::read($path. "_converted");
my $result   = Multi::Converter::toFileContent($exam);


is $expected, $result;
done_testing();