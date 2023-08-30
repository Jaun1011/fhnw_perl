package Multi::Parser;

use v5.36;
use strict;
use warnings;
use Data::Dumper;


sub _id($text){
	my $PATTERN_ID = qr(\b(\d+)\b);

    if ($text =~ $PATTERN_ID) {
    	return $1; 
    }

	die "no id defined in $text";
}

sub _question($text){
	my $PATTERN_QUESTION = qr(\d\.(.+?)\[)s;

    if ($text =~ $PATTERN_QUESTION) {
    	return $1; 
    }

	die "no question defined  in text $text";
}

sub _ansers($text){

	my $PATTERN_CHECKBOX        = qr(\[( |X|x)\] /);
	my $PATTERN_CHECKBOX_ANSWER = qr(\[(X|x\]));

    my @answers = map {
		my $result =  length ($_ =~ $PATTERN_CHECKBOX_ANSWER);
		my $text   = $_;

		$text =~ $PATTERN_CHECKBOX;

	    return (
			answer => $text,
			result => $result,
		);

	} ($text =~ /\s\[.*/g);

	return @answers;
}


sub _questions($text){

	my $id       = _id       $text;
	my $question = _question $text;
 	my @answers  = _ansers   $text;

    return (
   		id       => $id,
		question => $question,
		answers  => @answers,
	);
}

sub _metainfo($value, $keyword){		
	
	my $PATTERN_META = qr($keyword:\s*\[(?<info>.*)\]);

	if ($value =~ $PATTERN_META) {
		return $+{info};
	}

	die "no metadata info with $keyword";
}

sub parse($content){
	my $PATTERN_SPLITTER = qr(\n_+\n)s;

    my @parts     = split $PATTERN_SPLITTER, $content;
    my $preambel  = $parts[0];


    my @questions = [];

    for my $idx (1..$#parts) {
		my $part = $parts[$idx];
        push @questions, _questions($part);
    }

	my $student_id  = _metainfo($preambel, "Student ID");
	my $family_name = _metainfo($preambel, "Family Name");
	my $first_name  = _metainfo($preambel, "First Name");

    return (
		student_id  => $student_id,
		family_name => $family_name,
		first_name  => $first_name,

        preambel    => $preambel,
        questions   => @questions
    );    
}

1;
