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

	my $seed = int(rand(10000));

	my $time = strftime("%Y%m%d%H%M%S", localtime()); 
	my $file = $time. "_" .$seed. "_jku";
	
	my $target = "res/". $file;

	say $file;

	say strftime("%Y%m%d%H%M%S", localtime()); 

	my $content  = Multi::File::read($path);
	my $exam     = Multi::ExamLoader::load_exam($content);
	my $shuffled = Multi::Analysis::shuffleAnswers($seed, $exam);
	
	my $result = Multi::Converter::toFileContent($exam);
	Multi::File::write($result, $target);
	
	say strftime("%Y%m%d%H%M%S", localtime()); 
}

main();



