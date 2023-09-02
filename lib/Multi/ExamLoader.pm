package Multi::ExamLoader;

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
        \n(_|=){1,}\n
    

    <rule: question_answers>
        <question>

        <[answer]>+
        <separator>


    <token: question>
        <id> [[:punct:]] <text>


    <token: answer>
        <checkbox> \h* <text> \h*

    <token: text>
        (.*?)

    <token: checkbox>
        \[ [^]\v]* \]

    <token: id>
        \d+

}xms;

sub load_exam ($file_contents) {

    say "[info]\tstart matching";

    # build a grammar to parse any exam file...
    # match the file contents against the grammar to automatically create a data structure...
    if ($file_contents =~ $EXAM_FILE) {
        # return that data structure...
        say "[info]\tmatched file";
        return $/{exam};
    }
    

    say "[warning]\tfile did not match";
    return undef;    
}

1;
