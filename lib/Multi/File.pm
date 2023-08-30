package Multi::File;

use v5.36;
use strict;
use warnings;


sub read_file($filename){
    open(FH, '<', $filename) or die $!;

    my $content = "";

    while(<FH>){
        $content .= $_; 
    }
 
	return $content;
}
1;
