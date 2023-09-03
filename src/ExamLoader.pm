package ExamLoader;

use v5.36;
use strict;
use warnings;

use Data::Show;
use Regexp::Grammars;


my $EXAM_FILE = qr{
    <nocontext:>

    <exam>


    <rule: exam>
        <intro>
        <[question_answers]>+
        <end>


    <token: end>
        .*
        
    <rule: intro>
        <[identity_info]>+
        <instructions>
        <separator>


    <token: identity_info>
        ^ <key> :\h* \[ <value> \] \h*? \n
        
    <token: key>
        \N*?

    <token: value>
        \N*?

    <token: instructions>
        .*?
    
    <token: separator>
        (_|=){1,}
    

    <rule: question_answers>
        <question>

        <[answer]>+
        \n+
        <separator>
        \n+


    <token: question>
        <id> [[:punct:]] \h* <text>


    <token: answer>
        ^\h* <checkbox> \h* <text> \h*\n

    <token: text>
        (.*?)

    <token: checkbox>
        \[ [^]\v]* \]

    <token: id>
        \d+

}xms;

sub load_exam($file_contents) {


    # build a grammar to parse any exam file...
    # match the file contents against the grammar to automatically create a data structure...
    if ($file_contents =~ $EXAM_FILE) {
        # return that data structure...
        return $/{exam};
    }
    

    say "[warning]\tfile did not match";
    return undef;    
}

1;
