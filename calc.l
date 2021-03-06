%option noyywrap

%{
	#include <stdlib.h>
	#include "calc.tab.h"

	void yyerror(char* msg);
%}

%%

[0-9]+(\.[0-9]+)?([eE][0-9]+)?  {
	yylval.f = atof(yytext);
	return NUM;
}

[-+()*/^]    {
	return yytext[0];
}

[ \t\f\v\n] {
	;
}

.	{
	yyerror("Invalid Character");
}

%%