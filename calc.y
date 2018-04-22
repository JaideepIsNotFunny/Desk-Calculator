%{
 #define YYSTYPE double
 #include "lex.yy.c"
 #include <stdio.h>
 #include<ctype.h>
 
 void yyerror(char *);
 
%}

%token NUMBER
%left '%'
%left '+'  '-'

%left '*'  '/'

%right UMINUS
%right '^'
%%
lines:  E '\n' { printf("%f\n", $1);}
    |
    ;
E :E'+'E { $$=$1+$3; }
  |E'-'E { $$=$1-$3; }
  |E'*'E { $$=$1*$3; }
  |E'/'E { $$=$1/$3; }
  |'('E')' { $$=$2; }
  |'-'E %prec UMINUS { $$= -$2; }
  |E'^'E {
  				double i,j=$1;
  				for(i=1;i<$3;i++){
  					j=j*$1;
  					
  				}
  				$$=j;
  			}
  |E'%'E {
  				double divident=$1,divisor=$3;
  				while(divident>=divisor){
  					divident = divident - divisor;	
  				}
  				$$=divident;
  			}
  
  | NUMBER 
  ;



%%

void yyerror(char *s) {
 fprintf(stderr, "%s\n", s);
}



int main(void) {
 
 yyparse();
 return 0;
} 

