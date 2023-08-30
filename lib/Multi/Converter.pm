package Multi::Converter;

use v5.36;
use strict;
use warnings;

sub convert(%tokens){
	return "$tokens{preambel}";
}
1;