%{
	#include<stdlib.h>
	#include<stdio.h>
	#include<math.h>
	      
%}

%token DIGIT
%start line1

%%
line1 : line line1 | 'e''\n' ;

line : exp '\n' {printf("%d\n", $1);}
	;

exp  : exp'+'term {$$=$1+$3;}
	|term {$$=$1;}
	;
term : term '*' factor {$$=$1*$3;}
	|factor {$$=$1;}
	;
factor : '(' exp ')'	{$$=$2;}
       |DIGIT {$$=$1;} 
       ;

%%

int yylex()
{
	int c;
	c=getchar();
	if (isdigit(c))
	{
		yylval= c-48;
		return DIGIT;
	}	
	return c;
}

 yyerror(char *s)
{
	fprintf(stderr,"%s\n",s);
}

int main()
{
	
	yyparse();
	
	return 0;
}

