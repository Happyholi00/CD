%{
#include <stdio.h>
%}

DIGIT      [0-9]
ID         [a-zA-Z_][a-zA-Z0-9_]*
WS         [ \t]+

%%

"int"|"float"|"char"|"double"|"long"|"short"|"void"|"return"|"if"|"else"|"for"|"while"|"do"|"break"|"continue"   {
    printf("KEYWORD: %s\n", yytext);
}

{ID}       { printf("IDENTIFIER: %s\n", yytext); }
{DIGIT}+   { printf("NUMBER: %s\n", yytext); }

"+"|"-"|"*"|"/"|"="|"=="|"<"|">"|"<="|">="|"!="   { printf("OPERATOR: %s\n", yytext); }

"{"|"}"|"("|")"|"["|"]"|";"|","                    { printf("SYMBOL: %s\n", yytext); }

[ \t\r\n]+  { /* ignore whitespace */ }

.          { printf("UNKNOWN: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }


