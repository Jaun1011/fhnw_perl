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
                { checkbox => "[x]", text => "was ist die lösung für den nahost konflikt?" },
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
                { checkbox => "[x]", text => "was ist die lösung für din nahost konflikt?" },
                { checkbox => "[ ]", text => "abc 2" },
            ],
            question  => { id => 1, text => "question x" },
            separator => "___",
        }
    ]
};


my @expected = (
          {
        ansers => [
                    {
                      correct => 1,
                      message => "success with no total match:\nwas ist die l\xC3\xB6sung f\xC3\xBCr den nahost konflikt?\nwas ist die l\xC3\xB6sung f\xC3\xBCr din nahost konflikt?",
                    },
                    { correct => 1, message => "success" },
                  ],
        score  => 1,
      }, 
);

my @result = ExamChecker::check_exam($master_exam, $student_exam);
is_deeply(\@result, \@expected);

done_testing();
