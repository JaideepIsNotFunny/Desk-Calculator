%{
#include "calc.tab.h"


%}
%option noyywrap
%%
[ \t]       ; /* skip whitespace */
[0-9]+|[0-9]*\.[0-9]+  { yylval=atof(yytext);
                		return NUMBER;}
\n|.    {return yytext[0];}




%%
