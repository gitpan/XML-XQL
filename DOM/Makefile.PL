use ExtUtils::MakeMaker;

#@extras = ();
#
#push(@extras,
#     ABSTRACT_FROM => 'XQL.pm',		#?? this generates a warning - WHY?
#     AUTHOR        => 'Enno Derksen (enno@att.com)'
#) if ($ExtUtils::MakeMaker::Version >= 5.4301);

WriteMakefile(
              NAME	=> 'XML::XQL::DOM',
              PREREQ_PM => { XML::DOM => '0' },
#	      @extras
             );

