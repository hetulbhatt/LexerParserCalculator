%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>

	extern int yylex();
	void yyerror(char* msg);
%}

%union {
	float f;
}

%token <f> NUM
%type <f> E T P F

%%

S	: E			{printf("%f\n", $1);}
	;

E	: E '+' T	{$$ = $1 + $3;}
	| E '-' T	{$$ = $1 - $3;}
	| T			{$$ = $1;}
	;

T	: T '*' P	{$$ = $1 * $3;}
	| T '/' P	{$$ = $1 / $3;}
	| P			{$$ = $1;}
	;

P	: F '^' P	{$$ = pow($1, $3);}
	| F			{$$ = $1;}
	;

F	: '(' E ')'	{$$ = $2;}
	| '-' F		{$$ = -$2;}
	| NUM		{$$ = $1;}
	;

%%

void yyerror(char* msg) {
	fprintf(stderr, "%s\n", msg);
	exit(1);
}

int main() {
	yyparse();
	return 0;
}