use ExtUtils::MakeMaker;

#@extras = ();

#push(@extras,
#     ABSTRACT_FROM => 'XQL.pm',		#?? this generates a warning - WHY?
#     AUTHOR        => 'Enno Derksen (enno@att.com)'
#) if ($ExtUtils::MakeMaker::Version >= 5.4301);

WriteMakefile(
              NAME	=> 'XML::XQL::Parser',
#              VERSION_FROM => 'XQL.pm',
              PREREQ_PM => { Parse::Yapp => '0' },

	      PM => { 'Parser.pm' => '$(INST_LIBDIR)/Parser.pm' },

	      # Is this cheating or this this the only way to do it?
	      # Note: yapp.pl comes with Parse::Yapp
	      depend => { 'Parser.pm' => "Parser.yp\n\t\@\$(FULLPERL) \$(INSTALLBIN)/yapp.pl -m XML::XQL::Parser Parser.yp > Parser.pm"  },
#	      @extras
             );

