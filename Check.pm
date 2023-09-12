package Generator;
use v5.36;
use strict;
use warnings;


use Data::Show;

use lib 'src';
use Arguments;
use File;
use ExamLoader;
use Shuffle;
use ExamChecker;





sub main(){
	 
	my $arguments = Arguments::load();
	
	my $master_file = $arguments->{master};
	my $student_file = $arguments->{target};
	
	my $master_content  = File::read($master_file);
	my $master_exam     = ExamLoader::load_exam($master_content);
	
	my $student_content  = File::read($student_file);
	my $student_exam     = ExamLoader::load_exam($student_content);
	
	ExamChecker::check_exam($master_exam, $student_exam);

}

main()