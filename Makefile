run:
	perl main.pl
test:
	prove t

install:
	cpan install Data::Show Regexp::Grammars