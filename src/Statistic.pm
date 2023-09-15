package Statistic;

use v5.36;
use strict;
use warnings;

use Data::Show;

sub median(@items){

    my $i = int(scalar @items / 2);

    # if size of items is odd get back 
    if ($i % 2 == 1){
        return $items[$i];
    }

    return ($items[$i - 1] + $items[$i]) / 2;
}

#######################################################
# params: 
#       @items => array of numbers
# return:
#       sum of array
#######################################################
sub sum(@items){
    my $sum = 0;
    for (@items){
        $sum += $_
    } 
    return $sum;
}


#######################################################
# params: 
#       @items => array of numbers
# return:
#       max of array
#######################################################
sub min(@items){
    if ((scalar @items) == 0){
        return undef;
    }

    my $min = $items[0]; 
    for (@items){
        if ($min > $_) {
            $min = $_;
        }
    }

    return $min
}


sub max(@items){
    if ((scalar @items) == 0){
        return undef;
    }

    my $max = $items[0]; 
    for (@items){
        if ($max < $_) {
            $max = $_;
        }
    }

    return $max;
}


sub average(@items) {
    # no divisor through zero
    if (scalar @items == 0 ) { return undef; }

    return sum(@items) / scalar @items;     
}


sub analyse(@items){
    return {
        median => median (@items),
        average=> average(@items),
        max    => max    (@items),
        min    => min    (@items),
    }
}



sub count_items(@items){
    my $counter = ();
    for(@items){
        $counter->{$_} += 1;
    }
    return $counter;
}

1;
=head1 Usage
used in part 3


=head1 Description
The module provides basic statistic functions like sum, min, max median average...