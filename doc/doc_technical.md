# Technical Documentation

## Version & Dependecies

The project was developed with version `v5.36`.

Used dependencies are:


    Regexp::Grammar
    Data::Show
    File::Basename


## Intro




The workflow is designed in a similar manner as unix tools.
Each module does a specifix task well independent.

**example**


```perl		
my $student_content  = File::read($file);
my $student_exam     = ExamLoader::load_exam($student_content);
my @checks           = ExamChecker::check_exam($master_exam, $student_exam);
```


The File::read part reads only the file. The ExamLoader loads only exam structures out of the string from the file loder.
The Code is in this mather composable.


## Grammar


The `ExamLoader.pm` module parses the text of the examfile into a hash.

The main grammar was implemented in class.

For comfort not to implement a parser from scratch, the module Regexp::Grammar was used.

The module provides a [BNf](https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form)
like structure to use regex in a maintainable form.





## Shuffling
The shuffling of the array is done with the [Fisher-Yates algorythm](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle).


## Question & Answer Compare

For the comparation of the texts, it is nessessary to normalize the texts. In the program are two layers to handle this. In the Module `TextNormalizer.pm` there are two major parts

- normalization of text
- calculation of the [levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)

If the levenshtein distance is less than 10% then the text is a match.

There are several messages the ExamChecker.pm Module is going to print. 
The most important cases are documenated in the tests under `t/ExamChecker_*`. 


The Threshold by 10 percent is too high. There are  questions which match but shouldnt


## 