package Multi::Converter;

use v5.36;
use strict;
use warnings;
use Data::Dumper;
use Data::Show;


sub intro($intro){
	
	my $result = "";

	foreach my $identity (@{$intro->{identity_info}}){
		$result .= "$identity->{key}: [$identity->{value}]\n";
	}

	$result .= $intro->{instructions};
	$result .= $intro->{separator};

	return $result;
}


sub question($question){
	return "$question->{id}. $question->{text}\n";
}

sub answer($answer){
	return "\t[ ] $answer->{text}\n"; 
}


sub question_answers($question_answers){

	show ($question_answers);

	my $ansers = join "", map { answer($_) } (@{$question_answers->{answer}});

	my $result  
		= question($question_answers->{question}) 
		. "\n" 
		. $ansers
		. "\n" 
		. $question_answers->{separator};


	return $result;
}

sub questions($question_answers){
	my $result = join "", map { question_answers $_ } @{$question_answers};
	return $result;
}

sub toFileContent($exam){

	my $result 
		= intro($exam->{intro})
		. questions($exam->{question_answers})
		. $exam->{end};

	return $result;
}
1;
