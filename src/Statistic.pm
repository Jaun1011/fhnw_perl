package Statistic;

use v5.36;
use strict;
use warnings;

use Data::Dumper;
use Data::Show;

sub median(@exams){
    return;
}

sub sum($items, $key){
    my $result = 0;
    for my $item (@{$items}){
        $result += $item->{$key};
    }

    return $result;
}

1;