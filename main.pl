use v5.36;
use strict;
use warnings;

use POSIX qw(strftime);

use lib 'src';
use File;
use ExamLoader;
use Converter;
use Analysis;

use Data::Show;


sub argumens(@argv){


	my $argumens = {
		command =>  shift @argv,
	};

	for (my $i = 0; $i < @argv; $i += 2) {
		my $key 	      = @argv[$i];
		my $value 		  = @argv[$i + 1];
 		$key 			  =~ s/-{1,2}//;

		$argumens->{$key} = $value;
	}

	return $argumens;
}


sub load_exam($path){
	my $content  = File::read($path);
	my $exam     = ExamLoader::load_exam($content);
	
	return $exam;	
}




sub generate_exam($argumens){



	my $seed   = int(rand(10000));
	my $time = strftime("%Y%m%d%H%M%S", localtime()); 
	my $file = $time. "_" .$seed . $argumens->{name};

	my $target = $argumens->{target}. $file;



	my $exam = load_exam($argumens->{master});

	show($exam);
	Analysis::shuffleAnswers($seed, $exam);
	
	my $result = Converter::toFileContent($exam);
	File::write($result, $target);
}


sub main(){

	my $argumens = argumens(@ARGV);



	if("generate" eq $argumens->{command}){
		say "> start generating..";
		generate_exam($argumens);
		return;
	}








	
}

main();



