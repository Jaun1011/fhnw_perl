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
                { checkbox => "[x]", text => "was ust die lösung für den nahost konflikt?" },
                { checkbox => "[ ]", text => "abc 2" },
            ],
            question  => { id => 1, text => "question x" },
            separator => "___",
        }
     ]
};


my $student_exam = {
    question_answers => [
        # question correct
        {
            answer    => [
                { checkbox => "[x]", text => "wus ist die lisung für den nahost konflikt?" },
                { checkbox => "[ ]", text => "abc 2" },
            ],
            question  => { id => 1, text => "question x" },
            separator => "___",
        }
    ]
};


my @expected = (
      {
        answers => [
            {
                correct => 0,
                message => "1) no answer defined for:\n\twus ist die lisung f\xC3\xBCr den nahost konflikt?\n",
            },
            { correct => 1, message => "" },
        ],
        score  => 0,
      },
);

my @result = ExamChecker::check_exam($master_exam, $student_exam);
is_deeply(\@result, \@expected);

done_testing();
