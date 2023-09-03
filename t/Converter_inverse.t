use v5.36;
use warnings;
use Test::More;


use Data::Show;
use Data::Dumper;

use lib 'src';
use Converter;
use ExamLoader;



my $exam = {
 	end => "END",
    intro => {
        identity_info => [
            { key => "key", value => "___" },
        ],
        instructions  => "INSTRUCTION:",
        separator     => "___",
    },
    question_answers => [
        {
            answer    => [
                { checkbox => "[ ]", text => "a 1" },
                { checkbox => "[ ]", text => "a 2" },
            ],
            question  => { id => 1, text => "question" },
            separator => "___",
        }
     ]
};

my $file = "key: [___]\nINSTRUCTION:\n___\n1. question\n\n\t[ ] a 1\n\t[ ] a 2\n\n___\nEND";
my $content = Converter::toFileContent($exam);

is $content, $file;

my $inverse_exam = ExamLoader::load_exam($file);

is_deeply($exam, $inverse_exam);

done_testing();
