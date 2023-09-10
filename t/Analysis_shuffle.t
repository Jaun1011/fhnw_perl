use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Analysis;


my $exam = {
    question_answers => [
        {
            answer => [
                {key => 1, text => 1},
                {key => 2, text => 1},
                {key => 3, text => 1},
                {key => 4, text => 1},
                {key => 5, text => 1},
                {key => 6, text => 1},
            ]
        }
    ]
};

my @answers = [
    { key => 5, text => 1 },
    { key => 1, text => 1 },
    { key => 3, text => 1 },
    { key => 2, text => 1 },
    { key => 6, text => 1 },
    { key => 4, text => 1 },
];

Analysis::shuffle_answers($exam, "1234");
is_deeply( @answers, $exam->{question_answers}->[0]->{answer});

done_testing();
