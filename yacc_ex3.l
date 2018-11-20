%{
#include<stdio.h>
#include<ctype.h>
#include"y.tab.h" 
%}

digit   [0-9]

%%
[ \t] ;
{digit}+  {yylval=atoi(yytext); return NUMBER;}
.|\n 	{ return yytext[0]; }

%%

