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
            question  => { id => 1, text => "question x" },
            separator => "___",
        }
     ]
};


my $student_exam = {
    question_answers => [
        {
            answer    => [
                { checkbox => "[ ]", text => "abc 1" },
                { checkbox => "[x]", text => "abc 2" },
            ],
            question  => { id => 1, text => "question x" },
            separator => "___",
        }
    ]
};



my @expected = (
    {
        ansers => [
            { correct => 0, message => "checkbox does not match" },
            { correct => 0, message => "checkbox does not match" },
        ],
        score  => "",
    },
);

my @result = ExamChecker::check_exam($master_exam, $student_exam);

is_deeply(\@result, \@expected);

done_testing();
