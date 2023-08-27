package Parser;

use v5.36;
use strict;
use warnings;


sub _id($text){
    if ($text =~ /\b(\d+)\b/) {
    	return $1; 
    }

	return "undefined";
}


sub _question($text){
    if ($text =~ /\d\.(.+?)\[/s) {
    	return $1; 
    }

	die "no question anwer defined";
}


sub _ansers($text){
    my @answers = map {
		my $result =  length ($_ =~ /\[(X|x\])/);
		my $text   = $_;

		$text =~ s/\[( |X|x)\] //;

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

	if ($value =~ /$keyword:\s*\[(.*)\]/) {
		return $1;
	}

	die "no metadata info with $keyword";
}

sub tokenize($content){

    my @parts     = split /_{4,100}\n/, $content;
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
