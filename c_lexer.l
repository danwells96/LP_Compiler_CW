
%{
#include <stdio.h>
%}

KEYWORD
IDENTIFIER
OPERATOR
CONSTANT
STRINGLITERAL
INVALID


%%

//here printf the required output... yytext = current token

%%

int main(){

	yylex();
	
	return 0;
}
