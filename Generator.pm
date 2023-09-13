package Generator;
use v5.36;
use strict;
use warnings;


use lib 'src';
use File;
use ExamLoader;
use Shuffle;
use Converter;

use Data::Show;

sub main(){
    
	my $master_file = @ARGV[0];

	my $content  = File::read($master_file);
	my $exam     = ExamLoader::load_exam($content);
	my $seed = int(rand(1000000));
    Shuffle::shuffle_answers($exam, $seed);
	
	my $target = File::generate_filename($master_file);
	my $result = Converter::convert_exam_to_string($exam);
	File::write($result, $target);
}

main()