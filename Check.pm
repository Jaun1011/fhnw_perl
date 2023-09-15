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


sub read_messages($file, @checks){
	my $message_buffer = "\n------------------" .$file . "------------------------\n";
	
	for (@checks){
		for($_->{answers}){
			for(@{$_}){
				if ($_->{message}){
					$message_buffer .= $_->{message} ."\n";
				}
			}
		}
	}
	return $message_buffer;

}

sub main(){
	 
	
	my $master_file  = $ARGV[0];
	shift @ARGV;


	my $master_content  = File::read($master_file);
	my $master_exam     = ExamLoader::load_exam($master_content);
	
	my @files = @ARGV;	
	
	my $score_buffer   = "";
	my $message_buffer = "";

	for my $file (@files){
		
		my $student_content  = File::read($file);

		my $student_exam     = ExamLoader::load_exam($student_content);
		
		my @checks           = ExamChecker::check_exam($master_exam, $student_exam);


		$score_buffer       .= $file. "\t" . Statistic::sum( map {$_->{score}}@checks) . "/". scalar @checks. "\n";
		$message_buffer     .= read_messages($file, @checks);
	}

	say "[scores]";
	say $score_buffer;

	say "[messages]";
	say $message_buffer;


}



main()