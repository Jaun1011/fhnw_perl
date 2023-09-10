package ExamChecker;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

use Clone qw (clone);


sub _check_question($master, $student){
    my $m_question = $master->{question}->{text};
    my $s_question = $student->{question}->{text};

    if ($m_question ne $s_question){
        return {
            question_master  => $m_question,
            question_student => $s_question,
        };    
    }

    return {};
}




sub _check_answers_checkbox($master, $student){

    my $size    = scalar @{$master->{answer}};
    my $counter = 0;

    for(my $i = 0; $i < $size; $i++){
        my ($qm, $qs) = ($master->{answer}->[$i], $student->{answer}->[$i]);

        if ($qm->{checkbox} eq $qs->{checkbox}){
            $counter++;
        }
    }

    return $counter == $size;

}


sub _check_question_answers($master, $student){
    return {
        question => _check_question($master, $student),
        correct  => _check_answers_checkbox($master, $student),
    }
}


sub check_exam($master_exam, $student, $seed){

    my $master = clone($master_exam);
    Analysis::shuffle_answers($master, $seed);

    my $result = {};
    for(my $i = 0; $i < $#{$master->{question_answers}}; $i++){
        my ($qm, $qs) = ($master->{question_answers}->[$i], $student->{question_answers}->[$i]);
        $result->{$i} = _check_question_answers($qm, $qs);
    }


    return $result;
}

1;

