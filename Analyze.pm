package Generator;
use v5.36;
use strict;
use warnings;


use Data::Show;

use lib 'src';
use File;
use ExamLoader;
use Shuffle;
use ExamChecker;
use Statistic;


sub accumulate_correct_questions(@questions){
	my %answers  = {};

	for (@questions){
		$_->{score};
	} 
	
	return 
}


sub main(){
	 
	
	my $master_file  = $ARGV[0];
	shift @ARGV;


	my $master_content  = File::read($master_file);
	my $master_exam     = ExamLoader::load_exam($master_content);
	
	my @files = @ARGV;	
	

	for my $file (@files){
		
		my $student_content  = File::read($file);
		my $student_exam     = ExamLoader::load_exam($student_content);
		my @checks           = ExamChecker::check_exam($master_exam, $student_exam);
	
	




	}

}



main()