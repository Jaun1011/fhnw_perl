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



	my %checks = ();


	my $answers = ();
	my $scores_file = ();
	for (@exams){

		my $file = $_->{file};
		my @checks = ExamChecker::check_exam($master_exam, $_->{exam});

		for my $check (@checks){
			$answers->{$check->{id}}->{answered} += 1;
			$answers->{$check->{id}}->{correct}  += $check->{score};
			$scores_file->{$file} += $check->{score};
		}
	}


	show($answers);
	show($scores_file);

	my @scores    = map { {file => $_, score => $scores_file->{$_}} } keys %{$scores_file};

	my $statistic = Statistic::analyse(sort map {$_->{score}} @scores);


	show($statistic);


	my $max_score =  scalar @{$master_exam->{question_answers}};


	# under 50%
	my @max_score_filtered =  grep { $_->{score} < $max_score / 2 } @scores;
	say join "\n", map { "[score < 50%]\t". $_->{file} . "\t".$_->{score} ."/" . $max_score } @max_score_filtered;




	# the last 25 percent over all
	my @max_score_filtered =  grep { $_->{score} < $max_score / 2 } @scores;
	my @under_cohort       =  sort { $a->{score} > $b->{score}  } @scores;

	for my $i (0..scalar int(@under_cohort /4)){
		say "[bottom 25% of cohort]\t" . @under_cohort[$i]->{file} . "\t".$under_cohort[$i]->{score} . "/" . $max_score ;
	}



	# under the standard derivation
	my @max_score_filtered =  grep { $_->{score} < $statistic->{mean} - $statistic->{std} } @scores;
	my @std_under =  sort { $a->{score} > $b->{score}  } @scores;


	say join "\n", map { "[score > 1σ below mean]\t". $_->{file} . "\t".$_->{score} ."/" . $max_score } @std_under;


	# all 
}












main()