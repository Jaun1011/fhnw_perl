package Multi::Analysis;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

# Fisher-Yates algorythm 
sub shuffle($seed, @items){
    srand($seed);
    my $size = scalar @items;

    for (my $i = 0; $i < $size; $i++){
        my $rand = int(rand($size));
        @items[$rand, $i] = @items[$i, $rand];

    }

    return @items;
}

1;