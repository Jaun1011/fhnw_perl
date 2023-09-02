use v5.36;
use strict;
use warnings;
use lib 'lib';

use POSIX qw(strftime);

use Multi::File;
use Multi::ExamLoader;
use Multi::Converter;
use Multi::Analysis;

use Data::Show;

sub main(){


	my $path   = "./t/res/basic_test_exam";
	my $target = "res/". strftime("%Y%m%d%H%M%S", localtime()) . "_jku";  


	my $content  = Multi::File::read($path);
	my $exam     = Multi::ExamLoader::load_exam($content);
	my $shuffled = Multi::Analysis::shuffleAnswers($target,$exam);
	
	my $result = Multi::Converter::toFileContent($exam);
	Multi::File::write($result, $target);
}

main();



