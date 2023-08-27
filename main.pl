use v5.36;
use strict;
use warnings;
use Data::Dumper;

sub read_file($filename){
    open(FH, '<', $filename) or die $!;

    my $content = "";

    while(<FH>){
        $content .= $_; 
    }
    return $content;
}


sub question_id($text){
    if ($text =~ /\b(\d+)\b/) {
    	return $1; 
    }

	return "undefined";
}


sub question_question($text){

    if ($text =~ /\d\.(.+?)\[/s) {
    	return $1; 
    }
	die "no question anwer defined";
}


sub question_ansers($text){
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


sub tokenize_questions($text){

    my $id       = question_id       ($text);
	my $question = question_question ($text);
	my @answers  = question_ansers   ($text);

    return (
   		id       => $id,
		question => $question,
		answers  => @answers,
	);
}

sub get_metainfo($value, $keyword){		
	if ($value =~ /$keyword:\s*\[(.*)\]/) {
		return $1;
	}

	die "no metadata info with $keyword";
}

sub tokenize($content){

    my @parts     = split /_{4,100}\n/, $content;
    my $preambel  = $parts[0];
    my @questions = [];

	my $student_id  = get_metainfo($preambel, "Student ID");
	my $family_name = get_metainfo($preambel, "Family Name");
	my $first_name  = get_metainfo($preambel, "First Name");

    for my $idx (1..$#parts) {
        push @questions, tokenize_questions $parts[$idx];
    }

    return (
        preambel  => $preambel,
        questions => @questions
    );    
}

sub main(){
    my %tokens = tokenize read_file ("res/SampleEntranceExams/FHNW_Perl_Class/0_ENTRANCE_EXAM_MASTER_");

}

main();



