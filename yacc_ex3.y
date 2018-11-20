%{
	#include<stdlib.h>
	#include<stdio.h>
	#include<math.h>
	     
%}

%token NUMBER

%%

line : exp '\n' {printf("%d\n", $1);}
	;

exp:exp'+'term {$$=$1+$3;}
	|term {$$=$1;}
	;
term : term '*' factor {$$=$1*$3;}
	|factor {$$=$1;}
	;
factor : '(' exp ')'	{$$=$2;}
       |NUMBER {$$=$1;} 
       ;

%%

/*int yylex()
{
	int c;
	c=getchar();
	if (isdigit(c))
	{
		ungetc(c, stdin);
		scanf("%d",&yylval);
		return DIGIT;
	}	
	return c;
}*/

yyerror(char *s)
{
	fprintf(stderr,"%s\n",s);
}

int main()
{
	
	yyparse();
	
	return 0;
}

