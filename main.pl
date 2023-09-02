use v5.36;
use strict;
use warnings;
use lib 'lib';

use Multi::File;
use Multi::ExamLoader;
use Multi::Converter;

use Data::Show;

sub main(){


	my $path = "./t/res/basic_test_exam";
	my $content = Multi::File::read($path);

	my $exam   = Multi::ExamLoader::load_exam($content);
	my $result = Multi::Converter::toFileContent($exam);
	Multi::File::write($result, "./test");


}

main();



