# LexerParserCalculator

compilation steps:
bison -d calc.y
flex calc.l
gcc -o calc lex.yy.c calc.tab.c

note:
*IMPORTANT* Don't forget to enter ctrl+Z (windows), ctrl+D (unix) to explicitly end input to the lexer
