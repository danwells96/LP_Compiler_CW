c_lexer.c : c_lexer.l
	 lex -o c_lexer.c c_lexer.l
	
lexer : c_lexer.c
	gcc c_lexer.c -o lexer
	
