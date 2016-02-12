c_lexer : c_lexer.yy.c
	g++ c_lexer.yy.c -o c_lexer

c_lexer.yy.c : c_lexer.lex
	flex -o c_lexer.yy.c c_lexer.lex

clean :
	rm c_lexer.yy.c
	rm c_lexer
