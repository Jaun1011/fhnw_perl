package File;

use v5.36;
use strict;
use warnings;

use POSIX qw(strftime);

use File::Basename;

sub write($content, $filename){
    open(my $fh, '>', $filename) or die $!;
    print $fh $content;
    close($fh);
    
    # say "[info] write to file $filename";
}

sub read($filename){
    # say "[info] read file $filename";
    open my $fh, '<', $filename or return undef;
    local $/;
    return readline($fh);
}


sub generate_filename($filepath,){

    my ($filename, $dirs) = fileparse($filepath);

	my $time   = strftime("%Y%m%d-%H%M%S", localtime()); 
	my $file   = $time. "-" . $filename;
	my $target = $dirs . $file;
    
    return $target;
}

1;
=head1 Usage
used in every part

=head1 Description
The module provides a read, write subroutine for fileaccess and generate filename subroutine .
