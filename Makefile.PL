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

	      # Maybe requiring Date::Manip 5.33 is too strict,
	      # it's what I was using. I know 5.20 doesn't work.
              PREREQ_PM => { Date::Manip => '5.33', 
			     Parse::Yapp => '0',
			     XML::DOM => '1.12' },
	      EXE_FILES => [ 'samples/xql.pl'],
	      @extras
             );

