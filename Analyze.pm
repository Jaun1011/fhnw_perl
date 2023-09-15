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

	my @files       = @ARGV;	
	my $master_exam = _load_and_check_exams($master_file);



	my @exams = map { {
		exam => _load_and_check_exams($_),
		file => $_
	}} @files;



	my %checks      = ();
	my $answers     = ();
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

	my @scores    = map { {
		file  => $_,
		score => $scores_file->{$_}
	} } keys %{$scores_file};
	
	my $statistic = Statistic::analyse( sort map {$_->{score} } @scores);
	my $max_score = scalar @{$master_exam->{question_answers}};





	my @answered       = sort map {$answers->{$_}->{answered}} (keys %{$answers});
	my @correct        = sort map {$answers->{$_}->{correct}}  (keys %{$answers});
	
	my $count_answered = Statistic::count_items(@answered);
	my $count_correct  = Statistic::count_items(@correct);
	
	my $stats_answered = Statistic::analyse(@answered);
	my $stats_correct  = Statistic::analyse(@correct);


 
	say "[statistic over answered questions]";
	say "\tmedian: ". $stats_answered->{median};
	say "\tmean:   ". $stats_answered->{mean};
	say "\tstd:    ". $stats_answered->{std};
	say "\tmax:    ". $stats_answered->{max} .  "\tStudents = ". $count_answered->{ $stats_answered->{max} };
	say "\tmin:    ". $stats_answered->{min} .  "\tStudents = ". $count_answered->{ $stats_answered->{min} };



	say "\n[statistic over correct questions]";
	say "\tmedian: ". $stats_correct->{median};
	say "\tmean:   ". $stats_correct->{mean};
	say "\tstd:    ". $stats_correct->{std};
	say "\tmax:    ". $stats_correct->{max} .  "\tStudents = ". $count_correct->{ $stats_correct->{max} };
	say "\tmin:    ". $stats_correct->{min} .  "\tStudents = ". $count_correct->{ $stats_correct->{min} };





	say "\n[answers over all]";
	say "id\tanswered\tcorrect";
	for my $key (1.. $max_score){
		say $key . "\t" . $answers->{$key}->{answered} . "\t\t" .  $answers->{$key}->{correct}; 
	}
	say "";


	# under 50%
	my @max_score_filtered =  grep { $_->{score} < $max_score / 2 } @scores;
	say join "\n", map { "[score < 50%]\t". $_->{file} . "\t".$_->{score} ."/" . $max_score } @max_score_filtered;




	# the last 25 percent over all
	my @under_cohort          = sort { $a->{score} > $b->{score}  }   @scores;

	for my $i (0..scalar int(@under_cohort / 4)){
		say "[bottom 25% of cohort]\t" . $under_cohort[$i]->{file} . "\t" . $under_cohort[$i]->{score} . "/" . $max_score ;
	}



	# under the standard derivation
	my @max_score_filtered_mean = grep { $_->{score} < $statistic->{mean} - $statistic->{std} } @scores;
	my @std_under               = sort { $a->{score} > $b->{score}  } @max_score_filtered_mean;


	say join "\n", map { "[score > 1σ below mean]\t". $_->{file} . "\t".$_->{score} ."/" . $max_score } @std_under;


	# all 
}












main()