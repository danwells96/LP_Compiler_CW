/*c_parser.y*/

%code requires{
#include <stdio.h>


	struct expression{
		string identifier[];
	}

	struct function{
		string function_name;
		string parameters[];
	}
	
	struct function *makefunction(string identifier, string param[]);
	
	struct program_tree{
		struct function func;
		struct function *next_function;
	}

	struct program_tree *makebranch(struct function func);
	struct program_tree *root = 0;
}

%union{
	int intnum;
	char *string;
	long longnum;
	float floatnum;
	struct program_tree *node;

}


%token TIDENTIFIER TSEMICOLON TSTRINGLITERAL TAUTO TBREAK TCASE TCHAR TCONST TCONTINUE TDEFAULT TDO TDOUBLE
%token TELSE TENUM TEXTERN TFLOAT TFOR TGOTO TIF TINT TLONG TREGISTER TRETURN TSHORT TSIGNED TSIZEOF TSTATIC
%token TSTRUCT TSWITCH TTYPEDEF TUNION TUNSIGNED TVOID TVOLATILE TWHILE TPREPROCESSOR TCLOSEBRACKET TOPENBRACKET
%token TOPENCURLYBRACE TCLOSECURLYBRACE TINCREMENT TDECREMENT TADD TSUB TMULTIPLY TDIVIDE TASSIGN TEQUAL
%token TUNEQUAL TFUNCTIONCALL TARRAYINDEX TLOGICALNOT TBITWISENOT TMODULO TBITWISESHIFTLEFT TBITWISESHIFTRIGHT
%token TLESSTHAN TGREATERTHAN TLESSTHANEQUAL TGREATERTHANEQUAL TBITWISEAND TBITWISEOR TBITWISEXOR TLOGICALAND
%token TLOGICALOR TASSIGNSUM TASSIGNSUB TASSIGNMULT TASSIGNDIV TASSIGNMODULO TASSIGNBITLEFTSHIFT 
%token TASSIGNBITRIGHTSHIFT TASSIGNBITWISEAND TASSIGNBITWISEOR TASSIGNBITWISEXOR TCOMMA
%token TTERNARYCONDITION TELLIPSIS TMEMBERFUNCTION THEXINT TUNSIGNEDINT TSIGNEDINT TOCTALINT TFLOATCONST





%type	<string> TSTRINGLITERAL
%type	<string> TIDENTIFIER 
%type	<string> TSEMICOLON 
%type	<string> TAUTO 
%type	<string> TBREAK
%type	<string> TCASE 
%type	<string> TCHAR
%type	<string> TCONST 
%type	<string> TCONTINUE
%type	<string> TDEFAULT
%type	<string> TDO
%type	<string> TDOUBLE
%type	<string> TELSE 
%type	<string> TENUM 
%type	<string> TEXTERN 
%type	<string> TFLOAT 
%type	<string> TFOR 
%type	<string> TGOTO 
%type	<string> TIF 
%type	<string> TINT 
%type	<string> TLONG 
%type	<string> TREGISTER 
%type	<string> TRETURN 
%type	<string> TSHORT 
%type	<string> TSIGNED 
%type	<string> TSIZEOF 
%type	<string> TSTATIC
%type	<string> TSTRUCT 
%type	<string> TSWITCH
%type	<string> TTYPEDEF 
%type	<string> TUNION 
%type	<string> TUNSIGNED
%type	<string> TVOID
%type	<string> TVOLATILE 
%type	<string> TWHILE 
%type	<string> TPREPROCESSOR 
%type	<string> TCLOSEBRACKET
%type	<string> TOPENBRACKET
%type	<string> TOPENCURLYBRACE 
%type	<string> TCLOSECURLYBRACE 
%type	<string> TINCREMENT
%type	<string> TDECREMENT 
%type	<string> TADD 
%type	<string> TSUB 
%type	<string> TMULTIPLY
%type	<string> TDIVIDE 
%type	<string> TASSIGN 
%type	<string> TEQUAL
%type	<string> TUNEQUAL
%type	<string> TFUNCTIONCALL
%type	<string> TARRAYINDEX 
%type	<string> TLOGICALNOT 
%type	<string> TBITWISENOT
%type	<string> TMODULO 
%type	<string> TBITWISESHIFTLEFT 
%type	<string> TBITWISESHIFTRIGHT
%type	<string> TLESSTHAN 
%type	<string> TGREATERTHAN 
%type	<string> TLESSTHANEQUAL 
%type	<string> TGREATERTHANEQUAL 
%type	<string> TBITWISEAND 
%type	<string> TBITWISEOR 
%type	<string> TBITWISEXOR 
%type	<string> TLOGICALAND
%type	<string> TLOGICALOR 
%type	<string> TASSIGNSUM
%type	<string> TASSIGNSUB
%type	<string> TASSIGNMULT 
%type	<string> TASSIGNDIV 
%type	<string> TASSIGNMODULO 
%type	<string> TASSIGNBITLEFTSHIFT 
%type	<string> TASSIGNBITRIGHTSHIFT 
%type	<string> TASSIGNBITWISEAND 
%type	<string> TASSIGNBITWISEOR 
%type	<string> TASSIGNBITWISEXOR 
%type	<string> TCOMMA
%type	<string> TTERNARYCONDITION 
%type	<string> TELLIPSIS 
%type	<string> TMEMBERFUNCTION 
%type	<longnum> THEXINT 
%type	<intnum> TUNSIGNEDINT 
%type	<intnum> TSIGNEDINT 
%type	<longnum> TOCTALINT 
%type	<floatnum> TFLOATCONST
%type	<node> FUNCTION

%type	<string> OPERATOR
%type	<string> ASSIGNOPERATOR

%start FUNCTION




%%

//rules

OPERATOR : TADD
		 | TSUB 
		 | TMULTIPLY
		 | TDIVIDE
		 | TMODULO
		 | TLOGICALAND
		 | TLOGICALNOT
		 | TLOGICALOR 
		 | TBITWISEAND
		 | TBITWISENOT
		 | TBITWISEOR
		 | TBITWISESHIFTLEFT
		 | TBITWISESHIFTRIGHT
		 | TBITWISEXOR	{	}
ASSIGNOPERATOR : TASSIGN
			   | TUNEQUAL
			   | TASSIGNBITLEFTSHIFT
			   | TASSIGNBITRIGHTSHIFT
			   | TASSIGNBITWISEAND
			   | TASSIGNBITWISEOR
			   | TASSIGNBITWISEXOR
			   | TASSIGNDIV
			   | TASSIGNMODULO
			   | TASSIGNMULT
			   | TASSIGNSUM
			   | TASSIGNSUB
			   | TLESSTHAN
			   | TGREATERTHAN
			   | TLESSTHANEQUAL
			   | TGREATERTHANEQUAL	{	}
TYPE	:	TINT
		|	TDOUBLE
		|	TFLOAT
		|	TVOID
		|	TCHAR	{	}
START : FUNCTION	{root = $1;} 
EXPRESSION : TIDENTIFIER ASSIGNOPERATOR VALUE TSEMICOLON	{printf("    VARIABLE	:	%s", $1);}
		   | VALUE OPERATOR VALUE TSEMICOLON		{	}
		   | TIDENTIFIER ASSIGNOPERATOR EXPRESSION	{printf("    VARIABLE	:	%s", $1);}
PARAMETER	:	TYPE TIDENTIFIER TCOMMA PARAMETER	{printf("    PARAMETER	:	%s\n", $2);}
			|	TYPE TIDENTIFIER		   {printf("    PARAMETER	:	%s\n", $2);}
FUNCTION_HEAD	:	TYPE TIDENTIFIER TOPENBRACKET PARAMETER TCLOSEBRACKET TOPENCURLYBRACE	{$$ = makefunction($2, $4);}
RETURN	:	TRETURN VALUE TSEMICOLON	{	}
VALUE	:	TIDENTIFIER
		|	TUNSIGNEDINT
		|	THEXINT
		|	TFLOATCONST
		|	TSIGNEDINT
		|	TOCTALINT	{	}
DECLARATION	:	TYPE EXPRESSION	{	}
FUNCTION_BODY	:	DECLARATION			{printf("SCOPE\n");}
				|	EXPRESSION			{printf("SCOPE\n");}
				|	DECLARATION FUNCTION_BODY	{printf("SCOPE\n");}
				|	EXPRESSION FUNCTION_BODY	{printf("SCOPE\n");}
				|	IFLOOP				{printf("SCOPE\n");}
FUNCTION	:	FUNCTION_HEAD	FUNCTION_BODY	RETURN	TCLOSECURLYBRACE	{$$ = makebranch($1);}
IFLOOP	:	TIF TOPENBRACKET EXPRESSION TCLOSEBRACKET TOPENCURLYBRACE FUNCTION_BODY TCLOSECURLYBRACE	{	}
		|	TIF TOPENBRACKET EXPRESSION TCLOSEBRACKET TOPENCURLYBRACE FUNCTION_BODY TCLOSECURLYBRACE TELSE TOPENCURLYBRACE FUNCTION_BODY TCLOSECURLYBRACE	{	}	

%%

//usercode

struct program_tree *makebranch(struct function func){
	struct program_tree *res = malloc(sizeof(struct program_tree));
	res->function = func;
	res->next_function = NULL;
	return res;
}

	struct function *makefunction(string identifier, string param[]){
		struct function *res = malloc(sizeof(struct function));
		res->function_name = identifier;
		res->parameters[] = parameters[];
		return res;
	}



int main(){
	yyparser();
	
	return 0;
}


