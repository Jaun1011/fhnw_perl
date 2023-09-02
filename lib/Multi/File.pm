package Multi::File;

use v5.36;
use strict;
use warnings;

sub write($content, $filename){
    open(my $fh, '>', $filename) or die $!;
    print $fh $content;
    close($fh);
}



sub read($filename){
    say "read file $filename";
    open my $fh, '<', $filename or return undef;
    local $/;
    return readline($fh);
}
1;