package Generator;
use v5.36;
use strict;
use warnings;


use Data::Show;

use lib 'src';

use File;
use ExamLoader;
use ExamChecker;
use Statistic;


sub accumulate_correct_questions(@questions){
	my %answers  = {};

	for (@questions){
	} 
	
	return undef;
}


sub _load_and_check_exams($file){
	my $content= File::read($file);
	return ExamLoader::load_exam($content);
}

sub main(){
	 
	
	my $master_file  = $ARGV[0];
	shift @ARGV;
	my @files = @ARGV;	

	my $master_exam = _load_and_check_exams($master_file);



	my @exams =   map { {
		exam => _load_and_check_exams($_),
		file => $_
	}} @files;




	my @checks = ();
	for my $exam (@exams){

		push @checks, ExamChecker::check_exam($master_exam, $exam->{exam});
	}
 

	

	my %answers = ();
	for my $check (@checks){
		my $id = $check->{id};
		
		$answers{$id}{answered}  += 1;
		$answers{$id}{correct}   += $check->{score};
		$answers{$id}{wrong}     += 1 if $check->{score} == 0;
	}
	


	my @scores = map { Statistic::sum( map { $_->{score} } $_) } @checks;
	

	my $score_analysis = Statistic::analyse(@scores);

	show($score_analysis);






}






main()