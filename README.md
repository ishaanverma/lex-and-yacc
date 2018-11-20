# LEX PROGRAMS

## Introductions

The lex utility parses a file of characters. It uses regular expression matching; typically it is used to "tokenize" the contents of the file.

It is often used together with the `yacc` utility.

## Structure

There are 3 parts to a LEX program.

`
... Global Declaration ...
%%
... Rules (Regular Expressions) ..
%%
... Source Code ...
`

-  Example

`
%{
  int charcount=0, linecount=0;
%}

%%

. charcount++;
\n {linecount++, charcount++;}

%%

int main()  {
  yylex();
  printf("There were %d characters in %d lines\n", charcount, linecount);
  return 0;
}
`

Filename: count.l
To Build an executable, we run:

`
lex -t count.l > count.c
cc -c -o count.o count.l
cc -o counter count.o -ll
`





