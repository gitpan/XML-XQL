use ExtUtils::MakeMaker;

# Don't try to descend into subdirectories for testing

sub MY::test
{
  my $self = shift;

  my $hold = delete $self->{DIR};
  my $ret = $self->MM::test(@_);
  $self->{DIR} = $hold if defined($hold);
  $ret;
}

@extras = ();

push(@extras,
     ABSTRACT_FROM => 'XQL.pm',		#?? this generates a warning - WHY?
     AUTHOR        => 'Enno Derksen (enno@att.com)'
) if ($ExtUtils::MakeMaker::Version >= 5.4301);

WriteMakefile(
              NAME	=> 'XML::XQL',
              dist      => {COMPRESS => 'gzip', SUFFIX => '.gz'},
              VERSION_FROM => 'XQL.pm',
              PREREQ_PM => { Date::Manip => '0', 
			     Parse::Yapp => '0',
			     XML::DOM => '0' },
	      EXE_FILES => [ 'samples/xql.pl'],
	      @extras
             );

