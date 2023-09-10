use v5.36;
use strict;
use warnings;


use lib 'src';
use Analysis;
use File;
use ExamLoader;
use Converter;
use ExamChecker;

use Data::Show;


sub arguments(@argv){


	my $arguments = {
		command =>  shift @argv,
	};

	for (my $i = 0; $i < @argv; $i += 2) {
		my $key	  = $argv[$i];
		my $value = $argv[$i + 1];

 		$key 	  =~ s/-{1,2}//;
		$arguments->{$key} = $value;
	}

	return $arguments;
}


sub load_exam($path){
	my $content  = File::read($path);
	my $exam     = ExamLoader::load_exam($content);
	
	return $exam;	
}


sub generate_exam($arguments){

	my $seed = int(rand(1000000));

	my $exam = load_exam($arguments->{master});
	Analysis::shuffle_answers($exam, $seed);
	
	my $target = File::generate_filename(
		$arguments->{target},
		$arguments->{name},
		$seed
	);


	my $result = Converter::to_exam($exam);
	File::write($result, $target);
}




sub compare_exam($arguments){
	my $student_file = $arguments->{target};

	my $student_exam = load_exam($student_file);
	my $master_exam  = load_exam($arguments->{master});

	my $seed = File::extract_seed($student_file);
	
	ExamChecker::check_exam($master_exam, $student_exam, $seed);
}





sub main(){

	my $arguments = arguments(@ARGV);

	if ("generate" eq $arguments->{command}){
		say "> start generating..";
		generate_exam($arguments);
		return;
	}


	if ("compare" eq $arguments->{command}){
		say "> start check...";
		compare_exam($arguments);
		return;
	}
}

main();



