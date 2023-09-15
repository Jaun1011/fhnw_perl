package ExamChecker;

use v5.36;
use strict;
use warnings;

use Data::Show;

use lib 'src';
use TextNormalizer;



# the choosen threshold is by 10%. for smaller texts the theshold should maybe be higher
my $THRESHOLD_DISTANCE = 0.05;

sub _check_answers_checkbox($id, $student_answer, $master){

    my @hard_filter = grep {$_->{normalized_text} eq $student_answer->{normalized_text}} @{$master};


    # the levenshtein distance takes quite some time
    my @master      = map { $_->{distance} = TextNormalizer::levenshtein_percentage($_->{normalized_text},  $student_answer->{normalized_text} ); $_ } @{$master};
    my @distance    = grep { $_->{distance} <= $THRESHOLD_DISTANCE} @master;

    # check if an answer is found
    if (0 == scalar @distance){
        return {
            correct => 0,
            message => "$id) no answer defined for:\n\t" . $student_answer->{text} ."\n"
        };
    }

    # check if checkbox is equal
    my $master_answer = $distance[0];
    if (lc $master_answer->{checkbox} ne lc $student_answer->{checkbox}){
        return {
            correct => 0,
            message => ""
        };
    }

    # match was successfull
    return {
        correct => 1,
        # check if distance 
        message => $master_answer->{distance} == 0
            ? ""
            : "$id) success with no total match:\n\t" . $master_answer->{text} ."\n\t" . $student_answer->{text} . "\n",
    };
}




sub _check_answers($master, $student){
    my $id = $master->{question}->{id} ;
    
    my @master_answers  = map { $_->{normalized_text} = TextNormalizer::standart_normalize($_->{text}); $_ } @{ $master->{answer}  };
    my @student_answers = map { $_->{normalized_text} = TextNormalizer::standart_normalize($_->{text}); $_ } @{ $student->{answer} };


    my @checked_answers = map { _check_answers_checkbox($id, $_, \@master_answers) } @student_answers; 



    # sums up all correct answers and compares it to the size of the $master_answer var;
    my $result = 0;
    for my $checked (@checked_answers){
        $result += $checked->{correct};
    }

    return {
        id     => $id,
        score  => $result == scalar @master_answers ? 1 : 0,
        answers => \@checked_answers
    }
}


sub _check_question_answers($question, $master_questions){

    my $id = $question->{question}->{id};
    my @question_by_id = grep { $id == $_->{question}->{id} } @{$master_questions};

    # no queston was found
    if (0 == scalar @question_by_id){
        return {
            id => $id,
            score  => 0,
            message => "$id) no question found in master file.\n", 
        };
    }

    # check if questions are equal
    my $master_question = $question_by_id[0];
    if ($question->{question}->{text} ne $master_question->{question}->{text}){
        return {
            id => $id,
            score  => 0,
            message => "$id) questions are different.\n",
        }
    }

    my $result = _check_answers($master_question, $question);
    return $result; 
}


sub check_exam($master, $student){
    return map { _check_question_answers($_, $master->{question_answers}) } @{$student->{question_answers}};
}

1;

=head1 Usage
use in part 2,3


=head1 Description
The module is used to check if he exam is correct or not.
The main subroutine is check_exam.
As a result it gives back a list of checks against the questions and the answers
