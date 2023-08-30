use v5.36;
use warnings;
use Test::More;



use Data::Dumper;

use lib 'lib';
use Multi::Parser;
use Multi::File;



plan tests => 1;




my $content = Multi::File::read_file("res/SampleEntranceExams/FHNW_Perl_Class/0_ENTRANCE_EXAM_MASTER_"); 
my %tokens  = Multi::Parser::parse($content);



is_deeplys({}, %tokens, "check tokens");
ok(1);


done_testing(1);
