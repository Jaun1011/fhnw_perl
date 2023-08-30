use v5.36;
use strict;
use warnings;

use lib 'lib';

use Multi::Parser;
use Multi::Converter;
use Multi::File;

sub main(){
    my $content = Multi::File::read_file("res/SampleEntranceExams/FHNW_Perl_Class/0_ENTRANCE_EXAM_MASTER_"); 
	my %tokens  = Multi::Parser::parse($content);
	Converter::convert(%tokens);
}

main();



