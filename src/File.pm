package File;

use v5.36;
use strict;
use warnings;


use POSIX qw(strftime);

sub write($content, $filename){
    open(my $fh, '>', $filename) or die $!;
    print $fh $content;
    close($fh);
    
    say "write to file $filename";
}



sub read($filename){
    say "read file $filename";
    open my $fh, '<', $filename or return undef;
    local $/;
    return readline($fh);
}


sub generate_filename($dir, $name, $seed){
	my $time   = strftime("%Y%m%d%H%M%S", localtime()); 
	my $file   = $time. "_" . $seed ."_". $name;
	my $target = $dir. $file;

    return $target;
}


sub extract_seed($file){
    my $PATTERN_SEED = qr(.*_(?<seed>\d+)_.*);
    
    if ($file =~ $PATTERN_SEED){
        return int($+{seed});
    }
    
    return undef;
}

1;