use v5.36;
use strict;
use warnings;

use lib 'src';

use Parser;


use Data::Dumper;

sub read_file($filename){
    open(FH, '<', $filename) or die $!;

    my $content = "";

    while(<FH>){
        $content .= $_; 
    }
    
	return $content;
}

sub main(){
    my %tokens = Parser::tokenize(read_file "res/SampleEntranceExams/FHNW_Perl_Class/0_ENTRANCE_EXAM_MASTER_");
}

main();



