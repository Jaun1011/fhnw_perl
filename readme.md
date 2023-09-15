# Perl Exam Checker

- [technical documentation](doc/doc_technical.md)





## Usage

The program exists of three parts

## Generate

For generating a new students file the Generator.pm must be executed:


    perl Generator.pm  ./res/test/0_ENTRANCE_EXAM_MASTER_


The first parameter is the masterfile. In the same directory a new file will be created.

## Check

With the check part all given modules are getting compared to the master file.

    perl Check.pm  ./res/test/0_ENTRANCE_EXAM_MASTER_ ./res/test/*-*


## Analyze

The analyse module makes statistic analysis over the exams of the students.

    perl Analyze.pm  ./res/test/0_ENTRANCE_EXAM_MASTER_ ./res/test/*-*


