package Analysis;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

# Fisher-Yates algorythm 
sub _shuffle($items){
    my $size = scalar @{$items};

    for (my $i = 0; $i < $size; $i++){
        my $rand        = int(rand($size));

        my $tmp         = $items->[$i];
        $items->[$i]    = $items->[$rand];
        $items->[$rand] = $tmp;
    }
}



sub shuffleAnswers($seed, $exam){
    srand($seed);

    foreach my $q (@{$exam->{question_answers}}){
        _shuffle($q->{answer});
    }

}



sub check_exam($master_exam, $student_exam, $seed){
    srand($seed);

    my $size_master  = @{$master_exam->{question_answers}};
    my $size_student = @{$student_exam->{question_answers}};

    if($size_master != $size_student){
        die "no matching size of exam $size_master $size_student";
    }

    my $i = 0;


    my $result = []; 
    while ($i < $size_master){
        
        my @answers = @{$size_master[$i]->{answer}};
        _shuffle(\@answers);

        
           
        $i++;
    }
    return $result;
}

1;