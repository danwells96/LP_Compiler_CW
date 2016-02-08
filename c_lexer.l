
%{
#include <stdio.h>
%}

/*KEYWORD
IDENTIFIER
OPERATOR*/
CONSTANT	0[xX][0-9a-fA-F]+[uU]?[lL]?[lL]?|0[1-7]*[uU]?[lL]?[lL]?|[1-9][0-9]*[uU]?[lL]?[lL]?|[+-]?[1-9][0-9]*[lL]?[lL]?
		/*hex int|octal int|unsigned decimal int|signed decimal int*/
/*STRINGLITERAL
INVALID
*/

%%

{CONSTANT}	printf("%s	CONSTANT	TOKEN TYPE	LINENUM	SOURCEFILE	SOURCELINE", yytext);


%%

int main(){

	yylex();
	
	return 0;
}
