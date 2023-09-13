package ExamChecker;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

use lib 'src';
use TextNormalizer;

sub _check_answers_checkbox($student_answer, $master){


        my $THRESHOLD_DISTANCE = 0.1;

        my @master   = map { $_->{distance} = TextNormalizer::levenshtein_percentage($_->{normalized_text},  $student_answer->{normalized_text} ); $_ } @{$master};
        my @distance = grep { $_->{distance} <= $THRESHOLD_DISTANCE} @master;

        # check if an answer is found
        if (0 == scalar @distance){
            return {
                correct => 0,
                message => "no answer defined for " . $student_answer->{text}
            };
        }

        # check if checkbox is equal
        my $master_answer = $distance[0];
        if (lc $master_answer->{checkbox} ne lc $student_answer->{checkbox}){
            return {
                correct => 0,
                message => "checkbox does not match"
            };
        }

        # check if distance 
        if ($master_answer->{distance} > 0){
            return {
                correct => 1,
                message => "success with no total match:\n" . $master_answer->{text} ."\n" . $student_answer->{text},
            };
        }

        # match was successfull
        return {
            correct => 1,
            message => "success",
        };

}




sub _check_answers($master, $student){

    my @master_answers  = map { $_->{normalized_text} = TextNormalizer::standart_normalize($_->{text}); $_ } @{ $master->{answer}  };
    my @student_answers = map { $_->{normalized_text} = TextNormalizer::standart_normalize($_->{text}); $_ } @{ $student->{answer} };

    my @checked_answers = map { _check_answers_checkbox($_, \@master_answers) } @student_answers; 

    my $result = 0;
    for my $checked (@checked_answers){
        $result += $checked->{correct};
    }


    return {
        score  => $result == scalar @master_answers,
        ansers => \@checked_answers
    }


}


sub _check_question_answers($question, $master_questions){

    my @question_by_id = grep { $question->{question}->{id}  == $_->{question}->{id} } @{$master_questions};
    

    # no queston was found
    if (0 == scalar @question_by_id){
        return {
            score  => 0,
            message => "no question found in master file by id => " . $question->{question}->{id},
        };
    }

    # check if questions are equal
    my $master_question = $question_by_id[0];
    if ($question->{question}->{text} ne $master_question->{question}->{text}){
        return {
            score  => 0,
            message => "questions are different id => " . $question->{question}->{id},
            
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
use in part2