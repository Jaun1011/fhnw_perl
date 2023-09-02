use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'lib';

use Multi::ExamLoader;
use Multi::File;


my $path = "./t/res/basic_test_exam";


my $content = Multi::File::read($path);
my $exam = Multi::ExamLoader::load_exam($content);
my $ref = do "$path.pl";

is_deeply ($ref, $exam, "check tokens");

done_testing();