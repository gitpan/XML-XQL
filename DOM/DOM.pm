############################################################################
# Copyright (c) 1998 Enno Derksen
# All rights reserved.
# This program is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.
############################################################################
#
# Functions added to the XML::DOM implementation for XQL support
#
# NOTE: This code is a bad example of how to use XML::DOM.
# I'm accessing internal (private) data members for a little gain in performance.
# When the internal DOM implementation changes, this code will no longer work.
# But since I maintain XML::DOM, it's easy for me to keep them in sync.
# Regular users are adviced to use the XML::DOM API as described in the 
# documentation.
#

package XML::XQL::DOM;

BEGIN
{
    require XML::DOM;
    push @XML::DOM::Node::ISA, 'XML::XQL::Node';
}

package XML::DOM::Node;

sub xql_element
{
#?? I wonder which implemention is used for e.g. DOM::Text, since XML::XQL::Node also has an implementation
    [];
}

sub xql_document
{
    $_[0]->{Doc};
}

sub xql_node
{
    my $kids = $_[0]->{C};
    if (defined $kids)
    {
	# Must copy the list or else we return a blessed reference
	# (which causes trouble later on)
	my @list = @$kids;
	return \@list;
    }

    [];
}

#?? implement something to support NamedNodeMaps in DocumentType
sub xql_childIndex
{
    $_[0]->{Parent}->getChildIndex ($_[0]);
}

#?? implement something to support NamedNodeMaps in DocumentType
sub xql_childCount
{
    my $ch = $_[0]->{C};
    defined $ch ? scalar(@$ch) : 0;
}

sub xql_parent
{
    $_[0]->{Parent};
}

sub xql_DOM_nodeType
{
    $_[0]->getNodeType;
}

sub xql_nodeType
{
    $_[0]->getNodeType;
}

# As it appears in the XML document
sub xql_xmlString
{
    $_[0]->toString;
}

package XML::DOM::Element;

sub xql_attribute
{
    $_[0]->{A}->getValues;
}

# Used by XML::XQL::Union::genSortKey to generate sort keys
# Returns the maximum of the number of children and the number of Attr nodes.
sub xql_childCount
{
    my $n = scalar @{$_[0]->{C}};
    my $m = $_[0]->{A}->getLength;
    return $n > $m ? $n : $m;
}

sub xql_element
{
    my ($node, $elem) = @_;

    my @list = ();
    if (defined $elem)
    {
	for my $kid (@{$node->{C}})
	{
	    push @list, $kid if $kid->isElementNode && $kid->{TagName} eq $elem;
	}
    }
    else
    {
	for my $kid (@{$node->{C}})
	{
	    push @list, $kid if $kid->isElementNode;
	}
    }
    \@list;
}

sub xql_nodeName
{
    $_[0]->getNodeName;
}

sub xql_baseName
{
    my $name = $_[0]->getNodeName;
    $name =~ s/^\w*://;
    $name;
}

sub xql_prefix
{
    my $name = $_[0]->getNodeName;
    $name =~ /([^:]+):/;
    $1;
}

sub xql_rawText
{
    my ($self, $recurse) = @_;
    $recurse = 1 unless defined $recurse;

    my $text = "";

    for my $kid (@{$self->xql_node})
    {
	my $type = $kid->xql_nodeType;

	# type=1: element
	# type=3: text (Text, CDATASection, EntityReference)
	if (($type == 1 && $recurse) || $type == 3)
	{
	    $text .= $kid->xql_rawText ($recurse);
	}
    }
    $text;
}

sub xql_text
{
    my ($self, $recurse) = @_;
    $recurse = 1 unless defined $recurse;

    my $j = -1;
    my @text = ();
    my $last_was_text = 0;

    # Collect text blocks. Consecutive blocks of Text, CDataSection and 
    # EntityReference nodes should be merged without stripping and without
    # putting spaces in between.
    for my $kid (@{$self->xql_node})
    {
	my $type = $kid->xql_nodeType;

	if ($type == 1)	    # 1: element
	{
	    if ($recurse)
	    {
		$text[++$j] = $kid->xql_text ($recurse);
	    }
	    $last_was_text = 0;
	}
	elsif ($type == 3)  # 3: text (Text, CDATASection, EntityReference)
	{
	    ++$j unless $last_was_text;		# next text block
	    $text[$j] .= $kid->getData;
	    $last_was_text = 1;
	}
	else	# e.g. Comment
	{
	    $last_was_text = 0;
	}
    }

    # trim whitespace and remove empty blocks
    my $i = 0;
    my $n = @text;
    while ($i < $n)
    {
	$text[$i] = XML::XQL::trimSpace ($text[$i]);

	if ($text[$i] eq "")
	{
	    splice (@text, $i, 1);	# remove empty block
	    $n--;
	}
	else
	{
	    $i++;
	}
    }
    join (" ", @text);
}

#
# Returns a list of text blocks for this Element.
# A text block is a concatenation of consecutive text-containing nodes (i.e.
# Text, CDATASection or EntityReference nodes.)
# For each text block a reference to an array is returned with the following
# 3 items:
#  [0] index of first node of the text block
#  [1] index of last node of the text block
#  [2] concatenation of the raw text (of the nodes in this text block)
#
# The text blocks are returned in reverse order for the convenience of
# the routines that want to modify the text blocks.
#
sub xql_rawTextBlocks
{
    my ($self) = @_;

    my @result = ();
    my $curr;
    my $prevWasText = 0;
    my $kids = $self->{C};
    my $n = @$kids;
    for (my $i = 0; $i < $n; $i++)
    {
	my $node = $kids->[$i];
	# 3: text (Text, CDATASection, EntityReference)
	if ($node->xql_nodeType == 3)
	{
	    if ($prevWasText)
	    {
		$curr->[1] = $i;
		$curr->[2] .= $node->getData;
	    }
	    else
	    {
		$curr = [$i, $i, $node->getData];
		unshift @result, $curr;
		$prevWasText = 1;
	    }
	}
	else
	{
	    $prevWasText = 0;
	}
    }
    @result;
}

sub xql_replaceBlockWithText
{
    my ($self, $start, $end, $text) = @_;
    for (my $i = $end; $i > $start; $i--)
    {
	# dispose of the old nodes
	$self->removeChild ($self->{C}->[$i])->dispose;
    }
    my $node = $self->{C}->[$start];
    my $newNode = $self->{Doc}->createTextNode ($text);
    $self->replaceChild ($newNode, $node)->dispose;
}

sub xql_setValue
{
    my ($self, $str) = @_;
    # Remove all children
    for my $kid (@{$self->{C}})
    {
	$self->removeChild ($kid);
    }
    # Add a (single) text node
    $self->appendChild ($self->{Doc}->createTextNode ($str));
}

sub xql_value
{
    XML::XQL::elementValue ($_[0]);
}

package XML::DOM::Attr;

sub xql_nodeName
{
    $_[0]->getNodeName;
}

sub xql_text
{
    XML::XQL::trimSpace ($_[0]->getValue);
}

sub xql_rawText
{
    $_[0]->getValue;
}

sub xql_value
{
    XML::XQL::attrValue ($_[0]);
}

sub xql_setValue
{
    $_[0]->setValue ($_[1]);
}

sub xql_baseName
{
    my $name = $_[0]->getNodeName;
    $name =~ s/^\w*://;
    $name;
}

sub xql_prefix
{
    my $name = $_[0]->getNodeName;
    $name =~ s/:\w*$//;
    $name;
}

sub xql_parent
{
    $_[0]->{UsedIn}->{''}->{Parent};
}

sub xql_attrIndex
{
    my $map = $_[0]->{UsedIn};
    $map ? $map->getChildIndex ($_[0]) : 0;
}

package XML::DOM::Text;

sub xql_rawText
{
    $_[0]->{Data};
}

sub xql_text
{
    trimSpace ($_[0]->{Data});
}

sub xql_setValue
{
    $_[0]->setData ($_[1]);
}

package XML::DOM::CDATASection;

sub xql_rawText
{
    $_[0]->{Data};
}

sub xql_text
{
    trimSpace ($_[0]->{Data});
}

sub xql_setValue
{
    $_[0]->setData ($_[1]);
}

sub xql_nodeType
{
    3;	# it contains text, so XQL spec states it's a text node
}

package XML::DOM::EntityReference;

sub xql_text
{
    $_[0]->getData;
}

sub xql_rawText
{
    trimSpace ($_[0]->{Data});
}

sub xql_setValue
{
    $_[0]->setData ($_[1]);
}

sub xql_nodeType
{
    3;	# it contains text, so XQL spec states it's a text node
}

package XML::DOM::Document;

sub xql_element
{
    my ($node, $elem) = @_;

    my @list = ();
    if (defined $elem)
    {
	for my $kid (@{$node->{C}})
	{
	    push @list, $kid if $kid->isElementNode && $kid->{TagName} eq $elem;
	}
    }
    else
    {
	for my $kid (@{$node->{C}})
	{
	    push @list, $kid if $kid->isElementNode;
	}
    }
    \@list;
}

sub xql_parent
{
    undef;
}

package XML::DOM::DocumentFragment;

sub xql_element
{
    my ($node, $elem) = @_;

    my @list = ();
    if (defined $elem)
    {
	for my $kid (@{$node->{C}})
	{
	    push @list, $kid if $kid->isElementNode && $kid->{TagName} eq $elem;
	}
    }
    else
    {
	for my $kid (@{$node->{C}})
	{
	    push @list, $kid if $kid->isElementNode;
	}
    }
    \@list;
}

sub xql_parent
{
    undef;
}

1; # module loaded successfuly
