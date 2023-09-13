use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use ExamChecker;


my $master_exam = {
    question_answers => [
        {
            answer    => [
                { checkbox => "[x]", text => "abc 1" },
                { checkbox => "[ ]", text => "abc 2" },
            ],
            question  => { id => 1, text => "question xa" },
            separator => "___",
        }
     ]
};


my $student_exam = {
    question_answers => [
        # question correct
        {
            answer    => [
                { checkbox => "[x]", text => "abc 1" },
                { checkbox => "[ ]", text => "abc 2" },
            ],
            question  => { id => 1, text => "question x" },
            separator => "___",
        }
    ]
};



my @expected = (
    { message => "questions are different id => 1", score => 0 }
);

my @result = ExamChecker::check_exam($master_exam, $student_exam);
is_deeply(\@result, \@expected);

done_testing();
