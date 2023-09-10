package Generator;
use v5.36;
use strict;
use warnings;


use lib 'src';
use Arguments;
use File;
use ExamLoader;
use Shuffle;
use Converter;

use Data::Show;




sub main(){
	 
	my $arguments = Arguments::load();
	
	my $master_file = $arguments->{master};
	my $student_file = $arguments->{target};
	
	my $content  = File::read($master_file);
	my $exam     = ExamLoader::load_exam($content);
	

	my $student_exam = load_exam($student_file);
	my $master_exam  = load_exam($arguments->{master});

	my $seed = File::extract_seed($student_file);
	
	ExamChecker::check_exam($master_exam, $student_exam, $seed);

}

main()