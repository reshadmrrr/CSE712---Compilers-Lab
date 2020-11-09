all:
	flex lexer.l
	bison -t -d bison.y
	g++ lex.yy.c lexer.tab.c -o lexer.out
clear:
	rm -rf lexer.tab.c lexer.tab.h
	rm -rf lex.yy.c
	rm -rf lexer.out
