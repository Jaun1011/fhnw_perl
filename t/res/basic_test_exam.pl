
my $ref =   {
      end => "END OF EXAM\n====\n",
      intro => {
        identity_info => [
                           { key => "Student ID", value => "____________" },
                           { key => "Family Name", value => "____________" },
                           { key => "First Name", value => "____________" },
                         ],
        instructions  => "INSTRUCTIONS:\n\nComplete and return this multiple-choice exam\nno later than 23:59 CET Monday 23 August 2021.\n\nYou may consult any written material you wish\n(e.g. the class notes or the recommended textbook),\nbut you must not consult or collaborate with\nany other person.\n\nComplete this exam by placing an 'X' in the box\nbeside the single correct answer of each question,\nlike so:\n\n    [ ] This is not the correct answer\n    [ ] This is not the correct answer either\n    [ ] This is an incorrect answer\n    [X] This is the correct answer\n    [ ] This is an irrelevant answer\n\nWARNING: Each question has only one correct answer.\n         If two or more boxes are marked with an 'X',\n         the answer will be scored as zero.",
        separator     => "\n________________________________________________________________________________\n",
      },
      question_answers => [
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "Nothing: Perl variables don't have a static type\n",
                         },
                         { checkbox => "[ ]", text => "The name of the variable\n" },
                         {
                           checkbox => "[ ]",
                           text => "The type of the first value placed in the variable\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "The compile-time type declarator of the variable\n",
                         },
                         { checkbox => "[ ]", text => "Random chance" },
                       ],
          question  => {
                         id => 1,
                         text => " The static type of a Perl variable is determined by:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "List, scalar, and void\n" },
                         { checkbox => "[ ]", text => "List, linear, and void\n" },
                         { checkbox => "[ ]", text => "List, scalar, and null\n" },
                         { checkbox => "[ ]", text => "Null, scalar, and void\n" },
                         { checkbox => "[ ]", text => "Blood, sweat, and tears" },
                       ],
          question  => {
                         id => 2,
                         text => " Perl's three main types of call context (or \"amount context\") are:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "\$_\n" },
                         { checkbox => "[ ]", text => "\@_\n" },
                         { checkbox => "[ ]", text => "\$\$\n" },
                         { checkbox => "[ ]", text => "\$=\n" },
                         {
                           checkbox => "[ ]",
                           text => "The last variable that was successfully assigned to",
                         },
                       ],
          question  => {
                         id => 3,
                         text => " The \"default variable\" (or \"topic variable\") is:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "\@ARGV\n" },
                         { checkbox => "[ ]", text => "\$ARGV\n" },
                         { checkbox => "[ ]", text => "\@ARGS\n" },
                         { checkbox => "[ ]", text => "\@ARG\n" },
                         { checkbox => "[ ]", text => "\@_" },
                       ],
          question  => {
                         id => 4,
                         text => " You can access the command-line arguments of a Perl program via:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "CPAN\n" },
                         { checkbox => "[ ]", text => "CSPAN\n" },
                         { checkbox => "[ ]", text => "Github\n" },
                         { checkbox => "[ ]", text => "Perlhub\n" },
                         { checkbox => "[ ]", text => "www.perl.org" },
                       ],
          question  => {
                         id => 5,
                         text => " The main repository for Open Source Perl modules is:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "'\$' for scalars, '\@' for arrays, '%' for hashes\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "'\$' for scalars, '\@' for hashes, '%' for arrays\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "'\$' for scalars, '\@' for consts, '%' for literals\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "'\$' for numeric, '\@' for emails, '%' for percentages\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "'\$' for lookups, '\@' for reuses, '%' for declarations",
                         },
                       ],
          question  => {
                         id => 6,
                         text => " The three standard sigils for variable declarations are:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "'my' variables are lexically scoped;  'our' variables are package scoped\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "'my' variables are subroutine scoped; 'our' variables are block scoped\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "'my' variables are compile-time;      'our' variables are run-time\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "'my' variables must be scalars;       'our' variables must be arrays or hashes\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "'my' variables are assignable;        'our' variables are constants",
                         },
                       ],
          question  => {
                         id => 7,
                         text => " The difference between a 'my' variable and an 'our' variable is:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "...does not interpolate variables or backslashed escape sequences\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...only interpolates variables, but not backslashed escape sequences\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...only interpolates backslashed escape sequences, but not variables\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...interpolates both variables and backslashed escape sequences\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...converts its contents to ASCII, even if they are Unicode characters",
                         },
                       ],
          question  => {
                         id => 8,
                         text => " A single-quoted string (such as: 'I will achieve 100% on this exam')...",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "...another way of writing the double-quoted string: \"XXXXX\"\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...another way of writing the single-quoted string: 'XXXXX'\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...another way of writing the list of strings:  ('X', 'X', 'X', 'X', 'X')\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...another way of writing the array of strings:",
                         },
                         { checkbox => "['X', 'X', 'X', 'X', 'X']", text => "\n" },
                         {
                           checkbox => "[ ]",
                           text => "...a call to the 'qq' function, passing it a block of code",
                         },
                       ],
          question  => { id => 9, text => " The term qq{XXXXX} is..." },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "1'042\n" },
                         { checkbox => "[ ]", text => "1042\n" },
                         { checkbox => "[ ]", text => "1_042\n" },
                         { checkbox => "[ ]", text => "1.042e3\n" },
                         { checkbox => "[ ]", text => "0b10000010010" },
                       ],
          question  => {
                         id => 10,
                         text => " Which of the following is NOT a single valid Perl number?",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "A container for a list\n" },
                         { checkbox => "[ ]", text => "Exactly the same thing as a list\n" },
                         {
                           checkbox => "[ ]",
                           text => "Something that is always contained inside a list\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "A list with a predeclared fixed number of elements\n",
                         },
                         { checkbox => "[ ]", text => "A multidimensional list" },
                       ],
          question  => { id => 11, text => " An array is..." },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "...in all circumstances\n" },
                         {
                           checkbox => "[ ]",
                           text => "...only if it controls exactly one statement\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...only if it controls two or more statements\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...only if the statements it controls include a variable declaration\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...never; the curly brackets are always optional in an 'if' statement",
                         },
                       ],
          question  => {
                         id => 12,
                         text => " An 'if' statement requires curly brackets around the statements it controls...",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "elsif\n" },
                         {
                           checkbox => "[ ]",
                           text => "elseif  (with no whitespace between the two words)\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "else if (with whitespace between the two words)\n",
                         },
                         { checkbox => "[ ]", text => "elif\n" },
                         {
                           checkbox => "[ ]",
                           text => "ormaybe (with no whitespace between the two words)",
                         },
                       ],
          question  => {
                         id => 13,
                         text => " To specify a second alternative test after an 'if', the correct keyword is:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "...Perl evaluates as little as required to get a definite answer\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...Perl only evaluates each boolean expression once during the program\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...Perl defers evaluating the expression until the result is tested\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...Perl will never execute an 'else' block\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...Perl programs can cause CPUs to emit sparks if an expression is too complex",
                         },
                       ],
          question  => {
                         id => 14,
                         text => " \"Short-circuiting\" of a boolean expression means...",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "...once per element in the list, unless a 'last' is executed in the block\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...once per element in the list in all circumstances\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...endlessly, until a 'last' is executed in the loop\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...an unknown number of times, until the list being iterated is empty\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...never, because an array is not a list and cannot be iterated",
                         },
                       ],
          question  => {
                         id => 15,
                         text => " A \"foreach-style\" loop (such as: for (\@list) {...}) will be iterated...",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "...iterates until its condition is false at the start of an iteration\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...iterates until its condition is true at the start of an iteration\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...iterates until its condition becomes false anywhere within its block\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...iterates until its condition becomes true anywhere within its block\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...doesn't exist; Perl does not have a 'while' loop",
                         },
                       ],
          question  => { id => 16, text => " The 'while' loop in Perl..." },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "'given'  and 'when'    and 'default'\n" },
                         { checkbox => "[ ]", text => "'switch' and 'case'    and 'else'\n" },
                         {
                           checkbox => "[ ]",
                           text => "'gather' and 'take'    and 'otherwise'\n",
                         },
                         { checkbox => "[ ]", text => "'case'   and 'of'      and 'or'\n" },
                         { checkbox => "[ ]", text => "'whence' and 'whither' and 'thither'" },
                       ],
          question  => {
                         id => 17,
                         text => " The keywords for the Perl switch statement are:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "0, '0', '', (), undef\n" },
                         { checkbox => "[ ]", text => "0, '0', '', ()," },
                         { checkbox => "[]", text => "\n" },
                         { checkbox => "[ ]", text => "0, '0', 'false', 'False', 'FALSE'\n" },
                         { checkbox => "[ ]", text => "0, +0, -0, 0.0, -0.0\n" },
                         { checkbox => "[ ]", text => "False, Nil, Null, None, Empty" },
                       ],
          question  => {
                         id => 18,
                         text => " Which five Perl values are the only values that ever evaluate false?",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "Six:   because the four array elements will be flattened into the list\n",
                         },
                         { checkbox => "[ ]", text => "Eight: because 1 * 4 * 2 = 8\n" },
                         {
                           checkbox => "[ ]",
                           text => "Three: because the array will become a single element within the list\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Two:   because Perl ignores non-scalar variables in a list constructor\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "None:  because it won't compile; arrays can't be used in list constructors",
                         },
                       ],
          question  => {
                         id => 19,
                         text => " If the array \@x contains four elements,\n    how many elements will be in the list (1, \@x, 2)?",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "Values of any scalar type, indexed by keys that are always strings\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Values of any scalar or list type, indexed by keys that are always strings\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Values that are always strings, indexed by keys of any type\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Values that are unique, indexed by keys that may be repeated\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Random values, indexed by sequential keys of any type",
                         },
                       ],
          question  => { id => 20, text => " A hash variable stores..." },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "0 (because that's the correct mathematical outcome)\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "1 (as a convenience, to avoid subsequent division by zero)\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "A non-fatal warning (because 'Inf' is a string, not a number)\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "A fatal exception (because 'Inf' is a string, not a number)\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "An infinite evaluation loop; the program will run forever",
                         },
                       ],
          question  => { id => 21, text => " The expression 1 / 'Inf' produces the result:" },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "A type-safe immutable pointer to an existing value or variable\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "A mutable pointer to a value or variable, without type-checking\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "An alias (i.e. another name) for an existing variable\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "A deep copy of an existing variable or value\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "A link to the documentation for an existing value or variable",
                         },
                       ],
          question  => { id => 22, text => " A \"reference\" in Perl is best described as:" },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "...scalars, arrays, hashes, and subroutines\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...scalars, arrays, and hashes, but NOT subroutines\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...scalars and arrays, but NOT hashes or subroutines\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...arrays and hashes (i.e. containers), but NOT scalars or subroutines\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...only scalars (NOT to arrays, hashes, or subroutines)",
                         },
                       ],
          question  => { id => 23, text => " In Perl, you can take references to..." },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "'sub'\n" },
                         { checkbox => "[ ]", text => "'subroutine'\n" },
                         { checkbox => "[ ]", text => "'fun'\n" },
                         { checkbox => "[ ]", text => "'do'\n" },
                         {
                           checkbox => "[ ]",
                           text => "Nothing: subroutines are not explicitly declared in Perl",
                         },
                       ],
          question  => {
                         id => 24,
                         text => " User-defined subroutines are declared with the keyword:",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "\@_\n" },
                         { checkbox => "[ ]", text => "\$_\n" },
                         { checkbox => "[ ]", text => "\@ARGV\n" },
                         { checkbox => "[ ]", text => "\@ARGS\n" },
                         { checkbox => "[ ]", text => "\$ARGV" },
                       ],
          question  => {
                         id => 25,
                         text => " Which variable contains the argument with which a subroutine was called?",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "sub two_or_more (\$flag, \@data)           {...}\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "sub two_or_more (\$data, \$flag)           {...}\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "sub two_or_more (\$flag, \$data = \@extras) {...}\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "sub two_or_more (\$flag, ...)             {...}\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "sub two_or_more (\@flags, \@data_set)      {...}",
                         },
                       ],
          question  => {
                         id => 26,
                         text => " Which one of the following subroutine declarations correctly declares\n    a subroutine that can must be called with at least two arguments\n    but which may also be called with more than two arguments?",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "...it will return the value the last expression it actually evaluates\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...it will return the value the final statement in its code block\n",
                         },
                         { checkbox => "[ ]", text => "...it will return 'undef'\n" },
                         {
                           checkbox => "[ ]",
                           text => "...it will throw an exception after executing its final statement\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "...it will never return and will continue to execute forever",
                         },
                       ],
          question  => {
                         id => 27,
                         text => " If a user-defined subroutine does not contain a 'return' statement...",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         { checkbox => "[X]", text => "'die'\n" },
                         { checkbox => "[ ]", text => "'throw'\n" },
                         { checkbox => "[ ]", text => "'raise'\n" },
                         { checkbox => "[ ]", text => "'except'\n" },
                         { checkbox => "[ ]", text => "'exit'" },
                       ],
          question  => { id => 28, text => " The keyword to throw an exception in Perl is:" },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "Caught in an 'eval' block;  accessed via the special \$\@ variable\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Caught in an 'eval' block'; accessed via the special \$! variable\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Caught in a 'catch' block;  accessed via an 'access' block\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Caught in a 'try' block;    accessed via the builtin 'eval' function\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "Exceptions in Perl can't be caught or accessed after they're thrown",
                         },
                       ],
          question  => {
                         id => 29,
                         text => " How can exceptions be caught and subsequently accessed in Perl?",
                       },
          separator => "\n________________________________________________________________________________\n",
        },
        {
          answer    => [
                         {
                           checkbox => "[X]",
                           text => "It disallows undeclared variables, barewords, and symbolic references\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "It converts all warnings to fatal errors\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "It disallows package variables (all variables must be declared with 'my')\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "It reports all errors using verbose (and harshly worded) error messages\n",
                         },
                         {
                           checkbox => "[ ]",
                           text => "It prevents any construct that might also be valid C code",
                         },
                       ],
          question  => {
                         id => 30,
                         text => " What is the purpose of the 'use strict' pragma?",
                       },
          separator => "\n=====\n",
        },
      ],
    }
;