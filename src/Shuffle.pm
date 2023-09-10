package Shuffle;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

# Fisher-Yates algorythm 
sub _shuffle($items){
    my $size = scalar @{$items};
    for (my $i = 0; $i < $size; $i++){
        my $rand        = int(rand($size));

        my $tmp         = $items->[$i];
        $items->[$i]    = $items->[$rand];
        $items->[$rand] = $tmp;
    }
}

sub shuffle_answers($exam, $seed){
    say "seed = ".$seed;
    srand($seed);

    foreach my $q (@{$exam->{question_answers}}){
        _shuffle($q->{answer});
    }    
}
1;


=head1 Usage
used for part1 

