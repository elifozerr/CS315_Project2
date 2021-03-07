hep: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315f20_team15.yacc.y lex.yy.c
	yacc CS315f20_team15.yacc.y
lex.yy.c: CS315f20_team15.lex.l
	lex CS315f20_team15.lex.l
clean:
	rm -f lex.yy.c y.tab.c parser
