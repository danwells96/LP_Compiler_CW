%option noyywrap
%{
#include <stdio.h>
%}

PREPROCESSOR	#[a-z]+[ ]+["][a-z]+[.][h]["]|#[a-z]+[ ]+[<][a-z]+[>]
/*keywords section*/
AUTO			auto
BREAK			break
CASE			case
CHAR			char
CONST			const
CONTINUE		continue
DEFAULT			default
DO				do
DOUBLE			double
ELSE			else
ENUM			enum
EXTERN			extern
FLOAT			float
FOR				for
GOTO			goto
IF				if
INT				int
LONG			long
REGISTER		register
RETURN			return
SHORT			short
SIGNED			signed
SIZEOF			sizeof
STATIC			static
STRUCT			struct
SWITCH			switch
TYPEDEF			typedef
UNION			union
UNSIGNED		unsigned
VOID			void
VOLATILE		volatile
WHILE			while
/*end keywords section*/
IDENTIFIER		[a-zA-Z][a-zA-Z0-9_]*



CLOSEBRACKET	[)]
OPENBRACKET		[(]
SEMICOLON		[;]
OPENCURLYBRACE	[{]
CLOSECURLYBRACE	[}]
INCREMENT		[+][+]
DECREMENT		[-][-]
ADD				[+]
SUB				[-]
MULTIPLY		[*]
DIVIDE			[/]
EQUALS			[=]
EQUAL			[=][=]
UNEQUAL			[!][=]
FUNCTIONCALL	[(][)]
ARRAYINDEX		[[]]
LOGICALNOT		[!]
BITWISENOT		[~]





HEXINT			[0][xX][0-9a-fA-F]+[uU]?[lL]?[lL]?
UNSIGNEDINT		[1-9][0-9]*[uU]?[lL]?[lL]?
SIGNEDINT		[-]?[1-9][0-9]*[lL]?[lL]?
OCTALINT		[0][1-7]*[uU]?[lL]?[lL]?
/*STRINGLITERAL	["]([a-zA-Z0-9.,_£$!^&*()/@~:;+=<>?'#{}-]*[ \t\n]*[a-zA-Z0-9.,_£$!^&*()/@~:;+=<>?'#{}-]*)*["$]*/
STRINGLITERAL	["][-a-zA-Z0-9.,_£$!^&*()/@~:;+=<>?'#{} \t\n]*["$]
WS				[ ]|[\t]|[\n]

%%

{AUTO}			printf("%s		KEYWORD			TAuto		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{BREAK}			printf("%s		KEYWORD			TBreak		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{CASE}			printf("%s		KEYWORD			TCase		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{CHAR}			printf("%s		KEYWORD			TChar		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{CONST}			printf("%s		KEYWORD			TConst		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{CONTINUE}		printf("%s		KEYWORD			TContinue	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{DEFAULT}		printf("%s		KEYWORD			TDefault	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{DO}			printf("%s		KEYWORD			TDo			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{DOUBLE}		printf("%s		KEYWORD			TDouble		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{ELSE}			printf("%s		KEYWORD			TElse		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{ENUM}			printf("%s		KEYWORD			TEnum		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{EXTERN}		printf("%s		KEYWORD			TExtern		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{FLOAT}			printf("%s		KEYWORD			TFloat		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{FOR}			printf("%s		KEYWORD			TFor		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{GOTO}			printf("%s		KEYWORD			TGoto		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{IF}			printf("%s		KEYWORD			TIf			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{INT}			printf("%s		KEYWORD			TInt		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{LONG}			printf("%s		KEYWORD			TLong		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{REGISTER}		printf("%s		KEYWORD			TRegister	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{RETURN}		printf("%s		KEYWORD			TReturn		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{SHORT}			printf("%s		KEYWORD			Short		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{SIGNED}		printf("%s		KEYWORD			TSigned		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{SIZEOF}		printf("%s		KEYWORD			TSizeof		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{STATIC}		printf("%s		KEYWORD			TStatic		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{STRUCT}		printf("%s		KEYWORD			TStruct		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{SWITCH}		printf("%s		KEYWORD			TSwitch		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{TYPEDEF}		printf("%s		KEYWORD			TTypedef	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{UNION}			printf("%s		KEYWORD			TUnion		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{UNSIGNED}		printf("%s		KEYWORD			TUnsigned	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{VOID}			printf("%s		KEYWORD			TVoid		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{VOLATILE}		printf("%s		KEYWORD			TVolatile	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{WHILE}			printf("%s		KEYWORD			TWhile		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);



{PREPROCESSOR}	printf("%s		INVALID			TPreprocessor	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{IDENTIFIER}	printf("%s		IDENTIFIER		TIdentifier		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);




{CLOSEBRACKET}	printf("%s		OPERATOR		TCloseBracket		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{OPENBRACKET}	printf("%s		OPERATOR		TOpenBracket		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{SEMICOLON}		printf("%s		OPERATOR		TSemiColon			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{OPENCURLYBRACE}	printf("%s		OPERATOR		TOpenCurlyBrace		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{CLOSECURLYBRACE}	printf("%s		OPERATOR		TCloseCurlyBrace	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{INCREMENT}		printf("%s		OPERATOR		TIncrement			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{DECREMENT}		printf("%s		OPERATOR		TDecrement			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{ADD}			printf("%s		OPERATOR		TAdd				LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{SUB}			printf("%s		OPERATOR		TSub				LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{MULTIPLY}		printf("%s		OPERATOR		TMultiply			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{DIVIDE}		printf("%s		OPERATOR		TDivide				LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{EQUALS}		printf("%s		OPERATOR		TEquals				LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{EQUAL}			printf("%s		OPERATOR		TEqual				LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{UNEQUAL}		printf("%s		OPERATOR		TUnequal			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{FUNCTIONCALL}	printf("%s		OPERATOR		TFunctionCall		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{ARRAYINDEX}	printf("%s		OPERATOR		TArrayIndex			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{LOGICALNOT}	printf("%s		OPERATOR		TLogicalNOT			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{BITWISENOT}	printf("%s		OPERATOR		TBitwiseNOT			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);




{HEXINT}		printf("%s		CONSTANT		THex			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{UNSIGNEDINT}	printf("%s		CONSTANT		TUint			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{SIGNEDINT}		printf("%s		CONSTANT		TSignedint		LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{OCTALINT}		printf("%s		CONSTANT		TOctal			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{STRINGLITERAL}	printf("%s		STRINGLITERAL	TString			LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{WS}			;

%%

int main(){

	yylex();
	
	return 0;
}
