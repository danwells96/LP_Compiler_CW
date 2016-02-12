%option noyywrap
%{
#include <stdio.h>
int line_number = 1;
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
DO			do
DOUBLE			double
ELSE			else
ENUM			enum
EXTERN			extern
FLOAT			float
FOR			for
GOTO			goto
IF			if
INT			int
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



CLOSEBRACKET		[)]
OPENBRACKET		[(]
SEMICOLON		[;]
OPENCURLYBRACE		[{]
CLOSECURLYBRACE		[}]
INCREMENT		[+][+]
DECREMENT		[-][-]
ADD			[+]
SUB			[-]
MULTIPLY		[*]
DIVIDE			[/]
ASSIGN			[=]
EQUAL			[=][=]
UNEQUAL			[!][=]
FUNCTIONCALL		[(][)]
ARRAYINDEX		[[]]
LOGICALNOT		[!]
BITWISENOT		[~]
MODULO			[%]
BITWISESHIFTLEFT	[<][<]
BITWISESHIFTRIGHT	[>][>]
LESSTHAN		[<]
GREATERTHAN		[>]
LESSTHANEQUAL		[<][=]
GREATERTHANEQUAL	[>][=]
BITWISEAND		[&]
BITWISEOR		[|]
BITWISEXOR		(^)
LOGICALAND		[&][&]
LOGICALOR		[|][|]
ASSIGNSUM		[+][=]
ASSIGNSUB		[-][=]
ASSIGNMULT		[*][=]
ASSIGNDIV		[/][=]
ASSIGNMODULO		[%][=]
ASSIGNBITLEFTSHIFT	[<][<][=]
ASSIGNBITRIGHTSHIFT	[>][>][=]
ASSIGNBITWISEAND	[&][=]
ASSIGNBITWISEOR		[|][=]
ASSIGNBITWISEXOR	(^)[=]
COMMA			\,
TERNARYCONDITIONAL	[?][:]
ELLIPSIS		[\.][\.][\.]
MEMBERFUNCTION		[\.]|[-][>]





HEXINT			[0][xX][0-9a-fA-F]+[uU]?[lL]?[lL]?
UNSIGNEDINT		[1-9][0-9]*[uU]?[lL]?[lL]?
SIGNEDINT		[-]?[1-9][0-9]*[lL]?[lL]?
OCTALINT		[0][1-7]*[uU]?[lL]?[lL]?
FLOATCONST		([0-9]*([.][0-9]*)?)+[eE]?[-]?[0-9]*[fFlL]?
STRINGLITERAL		["][-a-zA-Z0-9.,_£$!^&*()/@~:;+=<>?'#{} \t\n]*["$]
WS			[ ]|[\t]
NEWLINE			[\n]

%%

{AUTO}			printf("%s		KEYWORD			TAuto			%i\n", yytext, line_number);
{BREAK}			printf("%s		KEYWORD			TBreak			%i\n", yytext, line_number);
{CASE}			printf("%s		KEYWORD			TCase			%i\n", yytext, line_number);
{CHAR}			printf("%s		KEYWORD			TChar			%i\n", yytext, line_number);
{CONST}			printf("%s		KEYWORD			TConst			%i\n", yytext, line_number);
{CONTINUE}		printf("%s		KEYWORD			TContinue		%i\n", yytext, line_number);
{DEFAULT}		printf("%s		KEYWORD			TDefault		%i\n", yytext, line_number);
{DO}			printf("%s		KEYWORD			TDo				%i\n", yytext, line_number);
{DOUBLE}		printf("%s		KEYWORD			TDouble			%i\n", yytext, line_number);
{ELSE}			printf("%s		KEYWORD			TElse			%i\n", yytext, line_number);
{ENUM}			printf("%s		KEYWORD			TEnum			%i\n", yytext, line_number);
{EXTERN}		printf("%s		KEYWORD			TExtern			%i\n", yytext, line_number);
{FLOAT}			printf("%s		KEYWORD			TFloat			%i\n", yytext, line_number);
{FOR}			printf("%s		KEYWORD			TFor			%i\n", yytext, line_number);
{GOTO}			printf("%s		KEYWORD			TGoto			%i\n", yytext, line_number);
{IF}			printf("%s		KEYWORD			TIf			%i\n", yytext, line_number);
{INT}			printf("%s		KEYWORD			TInt			%i\n", yytext, line_number);
{LONG}			printf("%s		KEYWORD			TLong			%i\n", yytext, line_number);
{REGISTER}		printf("%s		KEYWORD			TRegister		%i\n", yytext, line_number);
{RETURN}		printf("%s		KEYWORD			TReturn			%i\n", yytext, line_number);
{SHORT}			printf("%s		KEYWORD			Short			%i\n", yytext, line_number);
{SIGNED}		printf("%s		KEYWORD			TSigned			%i\n", yytext, line_number);
{SIZEOF}		printf("%s		KEYWORD			TSizeof			%i\n", yytext, line_number);
{STATIC}		printf("%s		KEYWORD			TStatic			%i\n", yytext, line_number);
{STRUCT}		printf("%s		KEYWORD			TStruct			%i\n", yytext, line_number);
{SWITCH}		printf("%s		KEYWORD			TSwitch			%i\n", yytext, line_number);
{TYPEDEF}		printf("%s		KEYWORD			TTypedef		%i\n", yytext, line_number);
{UNION}			printf("%s		KEYWORD			TUnion			%i\n", yytext, line_number);
{UNSIGNED}		printf("%s		KEYWORD			TUnsigned	%i\n", yytext, line_number);
{VOID}			printf("%s		KEYWORD			TVoid			%i\n", yytext, line_number);
{VOLATILE}		printf("%s		KEYWORD			TVolatile		%i\n", yytext, line_number);
{WHILE}			printf("%s		KEYWORD			TWhile			%i\n", yytext, line_number);



{PREPROCESSOR}	printf("%s		INVALID			TPreprocessor	%i\n", yytext, line_number);
{IDENTIFIER}	printf("%s		IDENTIFIER		TIdentifier		%i\n", yytext, line_number);




{CLOSEBRACKET}	printf("%s		OPERATOR		TCloseBracket		%i\n", yytext, line_number);
{OPENBRACKET}	printf("%s		OPERATOR		TOpenBracket		%i\n", yytext, line_number);
{SEMICOLON}		printf("%s		OPERATOR		TSemiColon		%i\n", yytext, line_number);
{OPENCURLYBRACE}	printf("%s		OPERATOR		TOpenCurlyBrace		%i\n", yytext, line_number);
{CLOSECURLYBRACE}	printf("%s		OPERATOR		TCloseCurlyBrace	%i\n", yytext, line_number);
{INCREMENT}		printf("%s		OPERATOR		TIncrement		%i\n", yytext, line_number);
{DECREMENT}		printf("%s		OPERATOR		TDecrement		%i\n", yytext, line_number);
{ADD}			printf("%s		OPERATOR		TAdd			%i\n", yytext, line_number);
{SUB}			printf("%s		OPERATOR		TSub			%i\n", yytext, line_number);
{MULTIPLY}		printf("%s		OPERATOR		TMultiply		%i\n", yytext, line_number);
{DIVIDE}		printf("%s		OPERATOR		TDivide			%i\n", yytext, line_number);
{ASSIGN}		printf("%s		OPERATOR		TAssign			%i\n", yytext, line_number);
{EQUAL}			printf("%s		OPERATOR		TEqual			%i\n", yytext, line_number);
{UNEQUAL}		printf("%s		OPERATOR		TUnequal		%i\n", yytext, line_number);
{FUNCTIONCALL}	printf("%s		OPERATOR		TFunctionCall		%i\n", yytext, line_number);
{ARRAYINDEX}	printf("%s		OPERATOR		TArrayIndex		%i\n", yytext, line_number);
{LOGICALNOT}	printf("%s		OPERATOR		TLogicalNOT		%i\n", yytext, line_number);
{BITWISENOT}	printf("%s		OPERATOR		TBitwiseNOT		%i\n", yytext, line_number);
{MODULO}		printf("%s		OPERATOR		TModulo			%i\n", yytext, line_number);
{BITWISESHIFTLEFT}	printf("%s	OPERATOR		TBitwiseShiftLeft		%i\n", yytext, line_number);
{BITWISESHIFTRIGHT}	printf("%s	OPERATOR		TBitwiseShiftRight		%i\n", yytext, line_number);
{LESSTHAN}		printf("%s		OPERATOR		TLessThan		%i\n", yytext, line_number);
{GREATERTHAN}	printf("%s		OPERATOR		TGreaterThan	%i\n", yytext, line_number);
{LESSTHANEQUAL}		printf("%s		OPERATOR		TLessThanOrEqual	%i\n", yytext, line_number);
{GREATERTHANEQUAL}	printf("%s		OPERATOR		TGreaterThanOrEqual	%i\n", yytext, line_number);
{BITWISEAND}	printf("%s		OPERATOR		TBitwiseAND		%i\n", yytext, line_number);
{BITWISEOR}		printf("%s		OPERATOR		TBitwiseOR		%i\n", yytext, line_number);
{BITWISEXOR}	printf("%s		OPERATOR		TBitwiseXOR		%i\n", yytext, line_number);
{LOGICALAND}	printf("%s		OPERATOR		TLogicalAND		%i\n", yytext, line_number);
{LOGICALOR}		printf("%s		OPERATOR		TLogicalOR		%i\n", yytext, line_number);
{ASSIGNSUM}		printf("%s		OPERATOR		TAssignSum		%i\n", yytext, line_number);
{ASSIGNSUB}		printf("%s		OPERATOR		TAssignSubtraction	%i\n", yytext, line_number);
{ASSIGNMULT}	printf("%s		OPERATOR		TAssignMultiply		%i\n", yytext, line_number);
{ASSIGNDIV}		printf("%s		OPERATOR		TAssignDivision		%i\n", yytext, line_number);
{ASSIGNMODULO}	printf("%s		OPERATOR		TAssignModulo		%i\n", yytext, line_number);
{ASSIGNBITLEFTSHIFT}	printf("%s		OPERATOR		TAssignBitwiseShiftLeft		%i\n", yytext, line_number);
{ASSIGNBITRIGHTSHIFT}	printf("%s		OPERATOR		TAssignBitwiseShiftRight	%i\n", yytext, line_number);
{ASSIGNBITWISEAND}		printf("%s		OPERATOR		TAssignBitwiseAND		%i\n", yytext, line_number);
{ASSIGNBITWISEOR}		printf("%s		OPERATOR		TAssignBitwiseOR		%i\n", yytext, line_number);
{ASSIGNBITWISEXOR}		printf("%s		OPERATOR		TAssignBitwiseXOR		%i\n", yytext, line_number);
{COMMA}			printf("%s		OPERATOR		TComma			%i\n", yytext, line_number);
{TERNARYCONDITIONAL}	printf("%s		OPERATOR		TTernaryConditional		%i\n", yytext, line_number);
{ELLIPSIS}		printf("%s		OPERATOR		TEllipsis		%i\n", yytext, line_number);
{MEMBERFUNCTION}	printf("%s		OPERATOR		TMemberFunction		%i\n", yytext, line_number);




{HEXINT}		printf("%s		CONSTANT		THex			%i\n", yytext, line_number);
{UNSIGNEDINT}	printf("%s		CONSTANT		TUint			%i\n", yytext, line_number);
{SIGNEDINT}		printf("%s		CONSTANT		TSignedInt		%i\n", yytext, line_number);
{OCTALINT}		printf("%s		CONSTANT		TOctal			%i\n", yytext, line_number);
{FLOATCONST}	printf("%s		CONSTANT		TFloat			%i\n", yytext, line_number);
{STRINGLITERAL}	printf("%s		STRINGLITERAL	TString			%i\n", yytext, line_number);
{WS}			;
{NEWLINE}		line_number++;
%%

int main(){

	yylex();
	
	return 0;
}
