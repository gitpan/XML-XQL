#########################################################################
#
#      This file was generated using Parse::Yapp version 0.16.
#
#          Don't edit this file, use source file instead.
#
#               ANY CHANGE MADE HERE WILL BE LOST !
#
#########################################################################
package XML::XQL::Parser;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '0.16',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'NCName' => 18,
			"any" => 24,
			"(" => 22,
			"all" => 4,
			"*" => 26,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17,
			"not" => 32
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'RelativePath' => 5,
			'LValue' => 6,
			'Union' => 7,
			'Conjunction' => 8,
			'Disjunction' => 9,
			'Grouping' => 11,
			'ElementName' => 10,
			'AbsolutePath' => 14,
			'PathOp' => 13,
			'Path' => 16,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Negation' => 21,
			'Query' => 23,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 1
		DEFAULT => -10
	},
	{#State 2
		ACTIONS => {
			":" => 34
		},
		DEFAULT => -4
	},
	{#State 3
		ACTIONS => {
			"[" => 35
		},
		DEFAULT => -49,
		GOTOS => {
			'Subscript_2' => 36
		}
	},
	{#State 4
		ACTIONS => {
			'NCName' => 18,
			"(" => 22,
			"*" => 26,
			'XQLName_Paren' => 12,
			"//" => 15,
			"." => 30,
			"/" => 31,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Filter' => 3,
			'Bang' => 27,
			'RelativePath' => 5,
			'LValue' => 37,
			'Invocation' => 28,
			'ElementName' => 10,
			'Grouping' => 11,
			'AbsolutePath' => 14,
			'PathOp' => 13,
			'Path' => 38,
			'Subscript' => 33
		}
	},
	{#State 5
		DEFAULT => -41
	},
	{#State 6
		ACTIONS => {
			'MATCH' => 40,
			'COMPARE' => 39
		},
		GOTOS => {
			'ComparisonOp' => 41
		}
	},
	{#State 7
		DEFAULT => -23
	},
	{#State 8
		ACTIONS => {
			"or" => 42
		},
		DEFAULT => -19
	},
	{#State 9
		DEFAULT => -1
	},
	{#State 10
		DEFAULT => -64
	},
	{#State 11
		DEFAULT => -57
	},
	{#State 12
		ACTIONS => {
			'NCName' => 18,
			'TEXT' => 43,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			")" => 47,
			"*" => 26,
			'NUMBER' => 44,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17,
			'INTEGER' => 46,
			"not" => 32
		},
		GOTOS => {
			'WildQName' => 1,
			'WildNCName' => 2,
			'Filter' => 3,
			'Union' => 7,
			'RelativePath' => 5,
			'LValue' => 6,
			'Conjunction' => 8,
			'Disjunction' => 45,
			'Invocation_2' => 48,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 16,
			'Param' => 49,
			'RelativeTerm' => 19,
			'Negation' => 21,
			'AttributeName' => 20,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 13
		ACTIONS => {
			"*" => 26,
			'NCName' => 18,
			'XQLName_Paren' => 12,
			"." => 30,
			"(" => 22,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Filter' => 3,
			'Bang' => 27,
			'RelativePath' => 50,
			'Invocation' => 28,
			'ElementName' => 10,
			'Grouping' => 11,
			'Subscript' => 33
		}
	},
	{#State 14
		DEFAULT => -40
	},
	{#State 15
		DEFAULT => -18
	},
	{#State 16
		ACTIONS => {
			'COMPARE' => -35,
			'MATCH' => -35
		},
		DEFAULT => -31
	},
	{#State 17
		ACTIONS => {
			"*" => 26,
			'NCName' => 18
		},
		GOTOS => {
			'WildQName' => 51,
			'WildNCName' => 2
		}
	},
	{#State 18
		DEFAULT => -2
	},
	{#State 19
		DEFAULT => -60
	},
	{#State 20
		DEFAULT => -65
	},
	{#State 21
		ACTIONS => {
			"and" => 52
		},
		DEFAULT => -21
	},
	{#State 22
		ACTIONS => {
			'NCName' => 18,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			"*" => 26,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17,
			"not" => 32
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'Union' => 7,
			'RelativePath' => 5,
			'LValue' => 6,
			'Conjunction' => 8,
			'Disjunction' => 53,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 16,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Negation' => 21,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 23
		ACTIONS => {
			'' => 54
		}
	},
	{#State 24
		ACTIONS => {
			"*" => 26,
			'NCName' => 18,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"(" => 22,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Filter' => 3,
			'Bang' => 27,
			'RelativePath' => 5,
			'LValue' => 55,
			'Invocation' => 28,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 38,
			'Subscript' => 33
		}
	},
	{#State 25
		ACTIONS => {
			'UnionOp' => 56
		},
		DEFAULT => -25
	},
	{#State 26
		DEFAULT => -3
	},
	{#State 27
		ACTIONS => {
			"//" => 15,
			"/" => 57
		},
		DEFAULT => -44,
		GOTOS => {
			'PathOp' => 58
		}
	},
	{#State 28
		DEFAULT => -63
	},
	{#State 29
		ACTIONS => {
			"intersect" => 59
		},
		DEFAULT => -27
	},
	{#State 30
		DEFAULT => -62
	},
	{#State 31
		ACTIONS => {
			'XQLName_Paren' => -17,
			"\@" => -17,
			'NCName' => -17,
			"(" => -17,
			"*" => -17,
			"." => -17
		},
		DEFAULT => -42
	},
	{#State 32
		ACTIONS => {
			'NCName' => 18,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			"*" => 26,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17,
			"not" => 32
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'Union' => 7,
			'RelativePath' => 5,
			'LValue' => 6,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 16,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Negation' => 60,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 33
		ACTIONS => {
			"!" => 61
		},
		DEFAULT => -46
	},
	{#State 34
		ACTIONS => {
			"*" => 26,
			'NCName' => 18
		},
		GOTOS => {
			'WildNCName' => 62
		}
	},
	{#State 35
		ACTIONS => {
			'NCName' => 18,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			"*" => 26,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			'INTEGER' => 64,
			"\@" => 17,
			"not" => 32
		},
		GOTOS => {
			'Subquery' => 66,
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'Union' => 7,
			'RelativePath' => 5,
			'LValue' => 6,
			'Disjunction' => 63,
			'Conjunction' => 8,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Range' => 67,
			'Path' => 16,
			'IndexArg' => 68,
			'RelativeTerm' => 19,
			'IndexList' => 65,
			'AttributeName' => 20,
			'Negation' => 21,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 36
		DEFAULT => -48
	},
	{#State 37
		ACTIONS => {
			'MATCH' => 40,
			'COMPARE' => 39
		},
		GOTOS => {
			'ComparisonOp' => 69
		}
	},
	{#State 38
		DEFAULT => -35
	},
	{#State 39
		DEFAULT => -29
	},
	{#State 40
		DEFAULT => -30
	},
	{#State 41
		ACTIONS => {
			'NCName' => 18,
			'TEXT' => 70,
			"(" => 22,
			"*" => 26,
			'NUMBER' => 71,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			'INTEGER' => 73,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Filter' => 3,
			'Bang' => 27,
			'RelativePath' => 5,
			'Invocation' => 28,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 72,
			'Subscript' => 33,
			'RValue' => 74
		}
	},
	{#State 42
		ACTIONS => {
			'NCName' => 18,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			"*" => 26,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17,
			"not" => 32
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'Union' => 7,
			'RelativePath' => 5,
			'LValue' => 6,
			'Conjunction' => 8,
			'Disjunction' => 75,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 16,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Negation' => 21,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 43
		DEFAULT => -9
	},
	{#State 44
		DEFAULT => -8
	},
	{#State 45
		DEFAULT => -6
	},
	{#State 46
		DEFAULT => -7
	},
	{#State 47
		DEFAULT => -13
	},
	{#State 48
		DEFAULT => -12
	},
	{#State 49
		ACTIONS => {
			"," => 77
		},
		DEFAULT => -15,
		GOTOS => {
			'Invocation_3' => 76
		}
	},
	{#State 50
		DEFAULT => -43
	},
	{#State 51
		DEFAULT => -11
	},
	{#State 52
		ACTIONS => {
			'NCName' => 18,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			"*" => 26,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17,
			"not" => 32
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'Union' => 7,
			'RelativePath' => 5,
			'LValue' => 6,
			'Conjunction' => 78,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 16,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Negation' => 21,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 53
		ACTIONS => {
			")" => 79
		}
	},
	{#State 54
		DEFAULT => -0
	},
	{#State 55
		ACTIONS => {
			'MATCH' => 40,
			'COMPARE' => 39
		},
		GOTOS => {
			'ComparisonOp' => 80
		}
	},
	{#State 56
		ACTIONS => {
			'NCName' => 18,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			"*" => 26,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'Union' => 81,
			'RelativePath' => 5,
			'LValue' => 6,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 16,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 57
		DEFAULT => -17
	},
	{#State 58
		ACTIONS => {
			"*" => 26,
			'NCName' => 18,
			'XQLName_Paren' => 12,
			"." => 30,
			"(" => 22,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Filter' => 3,
			'Bang' => 27,
			'RelativePath' => 82,
			'Invocation' => 28,
			'ElementName' => 10,
			'Grouping' => 11,
			'Subscript' => 33
		}
	},
	{#State 59
		ACTIONS => {
			'NCName' => 18,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			"*" => 26,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'RelativePath' => 5,
			'LValue' => 6,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 16,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Intersection' => 83,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 60
		DEFAULT => -24
	},
	{#State 61
		ACTIONS => {
			'XQLName_Paren' => 12
		},
		GOTOS => {
			'Invocation' => 84
		}
	},
	{#State 62
		DEFAULT => -5
	},
	{#State 63
		DEFAULT => -59
	},
	{#State 64
		ACTIONS => {
			"to" => 85
		},
		DEFAULT => -54
	},
	{#State 65
		ACTIONS => {
			"]" => 86
		}
	},
	{#State 66
		ACTIONS => {
			"]" => 87
		}
	},
	{#State 67
		DEFAULT => -55
	},
	{#State 68
		ACTIONS => {
			"," => 89
		},
		DEFAULT => -52,
		GOTOS => {
			'IndexList_2' => 88
		}
	},
	{#State 69
		ACTIONS => {
			'NCName' => 18,
			'TEXT' => 70,
			"(" => 22,
			"*" => 26,
			'NUMBER' => 71,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			'INTEGER' => 73,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Filter' => 3,
			'Bang' => 27,
			'RelativePath' => 5,
			'Invocation' => 28,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 72,
			'Subscript' => 33,
			'RValue' => 90
		}
	},
	{#State 70
		DEFAULT => -39
	},
	{#State 71
		DEFAULT => -38
	},
	{#State 72
		DEFAULT => -36
	},
	{#State 73
		DEFAULT => -37
	},
	{#State 74
		DEFAULT => -32
	},
	{#State 75
		DEFAULT => -20
	},
	{#State 76
		ACTIONS => {
			")" => 91
		}
	},
	{#State 77
		ACTIONS => {
			'NCName' => 18,
			'TEXT' => 43,
			"(" => 22,
			"any" => 24,
			"all" => 4,
			"*" => 26,
			'NUMBER' => 44,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			"\@" => 17,
			'INTEGER' => 46,
			"not" => 32
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'Filter' => 3,
			'Union' => 7,
			'RelativePath' => 5,
			'LValue' => 6,
			'Conjunction' => 8,
			'Disjunction' => 45,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 16,
			'Param' => 92,
			'RelativeTerm' => 19,
			'Negation' => 21,
			'AttributeName' => 20,
			'Intersection' => 25,
			'Bang' => 27,
			'Invocation' => 28,
			'Comparison' => 29,
			'Subscript' => 33
		}
	},
	{#State 78
		DEFAULT => -22
	},
	{#State 79
		DEFAULT => -61
	},
	{#State 80
		ACTIONS => {
			'NCName' => 18,
			'TEXT' => 70,
			"(" => 22,
			"*" => 26,
			'NUMBER' => 71,
			'XQLName_Paren' => 12,
			"." => 30,
			"//" => 15,
			"/" => 31,
			'INTEGER' => 73,
			"\@" => 17
		},
		GOTOS => {
			'WildNCName' => 2,
			'WildQName' => 1,
			'RelativeTerm' => 19,
			'AttributeName' => 20,
			'Filter' => 3,
			'Bang' => 27,
			'RelativePath' => 5,
			'Invocation' => 28,
			'ElementName' => 10,
			'Grouping' => 11,
			'PathOp' => 13,
			'AbsolutePath' => 14,
			'Path' => 72,
			'Subscript' => 33,
			'RValue' => 93
		}
	},
	{#State 81
		DEFAULT => -26
	},
	{#State 82
		DEFAULT => -45
	},
	{#State 83
		DEFAULT => -28
	},
	{#State 84
		DEFAULT => -47
	},
	{#State 85
		ACTIONS => {
			'INTEGER' => 94
		}
	},
	{#State 86
		DEFAULT => -50
	},
	{#State 87
		DEFAULT => -58
	},
	{#State 88
		DEFAULT => -51
	},
	{#State 89
		ACTIONS => {
			'INTEGER' => 64
		},
		GOTOS => {
			'IndexArg' => 95,
			'Range' => 67
		}
	},
	{#State 90
		DEFAULT => -34
	},
	{#State 91
		DEFAULT => -14
	},
	{#State 92
		ACTIONS => {
			"," => 77
		},
		DEFAULT => -15,
		GOTOS => {
			'Invocation_3' => 96
		}
	},
	{#State 93
		DEFAULT => -33
	},
	{#State 94
		DEFAULT => -56
	},
	{#State 95
		ACTIONS => {
			"," => 89
		},
		DEFAULT => -52,
		GOTOS => {
			'IndexList_2' => 97
		}
	},
	{#State 96
		DEFAULT => -16
	},
	{#State 97
		DEFAULT => -53
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'Query', 1, undef
	],
	[#Rule 2
		 'WildNCName', 1, undef
	],
	[#Rule 3
		 'WildNCName', 1, undef
	],
	[#Rule 4
		 'WildQName', 1,
sub {
 [ Name => $_[1] ]; 
}
	],
	[#Rule 5
		 'WildQName', 3,
sub {
 
			[ NameSpace => $_[1], Name => $_[2]]; 
}
	],
	[#Rule 6
		 'Param', 1, undef
	],
	[#Rule 7
		 'Param', 1,
sub {
 new XML::XQL::Number ($_[1]); 
}
	],
	[#Rule 8
		 'Param', 1,
sub {
 new XML::XQL::Number ($_[1]); 
}
	],
	[#Rule 9
		 'Param', 1,
sub {
 new XML::XQL::Text ($_[1]); 
}
	],
	[#Rule 10
		 'ElementName', 1,
sub {
 new XML::XQL::Element (@{$_[1]}); 
}
	],
	[#Rule 11
		 'AttributeName', 2,
sub {
 new XML::XQL::Attribute (@{$_[2]}); 
}
	],
	[#Rule 12
		 'Invocation', 2,
sub {

			my ($func, $type) = $_[0]->{Query}->findFunctionOrMethod ($_[1], $_[2]);

			new XML::XQL::Invocation (Name => $_[1], 
						  Args => $_[2],
						  Func => $func,
						  Type => $type); 
}
	],
	[#Rule 13
		 'Invocation_2', 1,
sub {
 [] 
}
	],
	[#Rule 14
		 'Invocation_2', 3,
sub {
 unshift @{$_[2]}, $_[1]; $_[2]; 
}
	],
	[#Rule 15
		 'Invocation_3', 0,
sub {
 [] 
}
	],
	[#Rule 16
		 'Invocation_3', 3,
sub {
 unshift @{$_[3]}, $_[2]; $_[3]; 
}
	],
	[#Rule 17
		 'PathOp', 1, undef
	],
	[#Rule 18
		 'PathOp', 1, undef
	],
	[#Rule 19
		 'Disjunction', 1, undef
	],
	[#Rule 20
		 'Disjunction', 3,
sub {
 
		    new XML::XQL::Or (Left => $_[1], Right => $_[3]); 
}
	],
	[#Rule 21
		 'Conjunction', 1, undef
	],
	[#Rule 22
		 'Conjunction', 3,
sub {
 
		    new XML::XQL::And (Left => $_[1], Right => $_[3]); 
}
	],
	[#Rule 23
		 'Negation', 1, undef
	],
	[#Rule 24
		 'Negation', 2,
sub {
 new XML::XQL::Not (Left => $_[2]); 
}
	],
	[#Rule 25
		 'Union', 1, undef
	],
	[#Rule 26
		 'Union', 3,
sub {
 
		    new XML::XQL::Union (Left => $_[1], Right => $_[3]); 
}
	],
	[#Rule 27
		 'Intersection', 1, undef
	],
	[#Rule 28
		 'Intersection', 3,
sub {
 
		    new XML::XQL::Intersect ($_[1], $_[3]); 
}
	],
	[#Rule 29
		 'ComparisonOp', 1,
sub {

		  [ $_[1], $_[0]->{Query}->findComparisonOperator ($_[1]) ]; 
}
	],
	[#Rule 30
		 'ComparisonOp', 1,
sub {

		  [ $_[1], $_[0]->{Query}->findComparisonOperator ($_[1]) ]; 
}
	],
	[#Rule 31
		 'Comparison', 1, undef
	],
	[#Rule 32
		 'Comparison', 3,
sub {

			new XML::XQL::Compare (All => 0, Left => $_[1], 
				Oper => $_[2]->[0], Func => $_[2]->[1], 
				Right => $_[3]); 
}
	],
	[#Rule 33
		 'Comparison', 4,
sub {

			new XML::XQL::Compare (All => 0, Left => $_[2], 
				Oper => $_[3]->[0], Func => $_[3]->[0],
				Right => $_[4]); 
}
	],
	[#Rule 34
		 'Comparison', 4,
sub {

			new XML::XQL::Compare (All => 1, Left => $_[2], 
				Oper => $_[3]->[0], Func => $_[3]->[0],
				Right => $_[4]); 
}
	],
	[#Rule 35
		 'LValue', 1, undef
	],
	[#Rule 36
		 'RValue', 1, undef
	],
	[#Rule 37
		 'RValue', 1,
sub {
 new XML::XQL::Number ($_[1]); 
}
	],
	[#Rule 38
		 'RValue', 1,
sub {
 new XML::XQL::Number ($_[1]); 
}
	],
	[#Rule 39
		 'RValue', 1,
sub {
 new XML::XQL::Text ($_[1]); 
}
	],
	[#Rule 40
		 'Path', 1, undef
	],
	[#Rule 41
		 'Path', 1, undef
	],
	[#Rule 42
		 'AbsolutePath', 1,
sub {
 new XML::Root; 
}
	],
	[#Rule 43
		 'AbsolutePath', 2,
sub {
 
		    new XML::XQL::Path (PathOp => $_[1], Right => $_[2]); 
}
	],
	[#Rule 44
		 'RelativePath', 1, undef
	],
	[#Rule 45
		 'RelativePath', 3,
sub {
 
		    new XML::XQL::Path (Left => $_[1], PathOp => $_[2], 
				        Right => $_[3]); 
}
	],
	[#Rule 46
		 'Bang', 1, undef
	],
	[#Rule 47
		 'Bang', 3,
sub {

		    XML::XQL::parseError ("only methods (not functions) can be used after the Bang (near '!" . $_[3]->{Name} . "'")
			unless $_[3]->isMethod;

		    new XML::XQL::Bang (Left => $_[1], 
				        Right => $_[3]); 
}
	],
	[#Rule 48
		 'Subscript', 2,
sub {
 
		    defined($_[2]) ? 
			new XML::XQL::Subscript (Left => $_[1], 
					    IndexList => $_[2]) : $_[1]; 
}
	],
	[#Rule 49
		 'Subscript_2', 0, undef
	],
	[#Rule 50
		 'Subscript_2', 3,
sub {
 $_[2]; 
}
	],
	[#Rule 51
		 'IndexList', 2,
sub {
 push (@{$_[1]}, @{$_[2]}); $_[1]; 
}
	],
	[#Rule 52
		 'IndexList_2', 0,
sub {
 [] 
}
	],
	[#Rule 53
		 'IndexList_2', 3,
sub {
 push (@{$_[2]}, @{$_[3]}); $_[2]; 
}
	],
	[#Rule 54
		 'IndexArg', 1,
sub {
 [ $_[1], $_[1] ]; 
}
	],
	[#Rule 55
		 'IndexArg', 1, undef
	],
	[#Rule 56
		 'Range', 3,
sub {

		    # Syntactic Constraint 9:
		    # If both integers are positive or if both integers are 
		    # negative, the first integer must be less than or
          	    # equal to the second integer. 

		    XML::XQL::parseError (
			"$_[1] should be less than $_[3] in '$_[1] $_[2] $_[3]'")
				if ($_[1] > $_[3] && ($_[1] < 0) == ($_[3] < 0));
		    [ $_[1], $_[3] ]; 
}
	],
	[#Rule 57
		 'Filter', 1, undef
	],
	[#Rule 58
		 'Filter', 4,
sub {
 
			new XML::XQL::Filter (Left => $_[1], Right => $_[3]); 
}
	],
	[#Rule 59
		 'Subquery', 1, undef
	],
	[#Rule 60
		 'Grouping', 1, undef
	],
	[#Rule 61
		 'Grouping', 3,
sub {
 $_[2]; 
}
	],
	[#Rule 62
		 'RelativeTerm', 1,
sub {
 new XML::XQL::Current; 
}
	],
	[#Rule 63
		 'RelativeTerm', 1, undef
	],
	[#Rule 64
		 'RelativeTerm', 1, undef
	],
	[#Rule 65
		 'RelativeTerm', 1, undef
	]
],
                                  @_);
    bless($self,$class);
}



1;
