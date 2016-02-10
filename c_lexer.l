%option noyywrap
%{
#include <stdio.h>
%}

KEYWORD		auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
IDENTIFIER	[a-zA-Z][a-zA-Z0-9_]*
OPERATOR	[<][<][=]?|[>][>][=]?|[+][+]|[-][-]|[|][|]?|[&][&]?|[-%<>+*/=!&^|][=]?|[[(),{};:~-]|[.][.][.]|]|[?][:]
CONSTANT	[0][xX][0-9a-fA-F]+[uU]?[lL]?[lL]?|[0][1-7]*[uU]?[lL]?[lL]?|[1-9][0-9]*[uU]?[lL]?[lL]?|[+-]?[1-9][0-9]*[lL]?[lL]?
			/*hex int|octal int|unsigned decimal int|signed decimal int*/
STRINGLITERAL	["]([a-zA-Z0-9.,_£$!^&*()/@~:;+=<>?'#{}-]*[ ]*[	]*[a-zA-Z0-9.,_£$!^&*()/@~:;+=<>?'#{}-]*)*["]
/*INVALID
*/

%%

{KEYWORD}		printf("%s	KEYWORD			TOKENTYPE	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{IDENTIFIER}	printf("%s	IDENTIFIER		TOKENTYPE	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{OPERATOR}		printf("%s	OPERATOR		TOKENTYPE	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{CONSTANT}		printf("%s	CONSTANT		TOKENTYPE	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);
{STRINGLITERAL}	printf("%s	STRINGLITERAL	TOKENTYPE	LINENUM	SOURCEFILE	SOURCELINE\n", yytext);

%%

int main(){

	yylex();
	
	return 0;
}
